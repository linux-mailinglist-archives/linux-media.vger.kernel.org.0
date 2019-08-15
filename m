Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56518F111
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731685AbfHOQlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:41:22 -0400
Received: from resqmta-po-04v.sys.comcast.net ([96.114.154.163]:54124 "EHLO
        resqmta-po-04v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731625AbfHOQlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:41:22 -0400
Received: from resomta-po-03v.sys.comcast.net ([96.114.154.227])
        by resqmta-po-04v.sys.comcast.net with ESMTP
        id yH4thrwIzStIYyIoShfWx0; Thu, 15 Aug 2019 16:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1565887280;
        bh=T27sPdvhg3w5scOwf0dBlTgIfoibPX3rpRRfI+oJzPk=;
        h=Received:Received:From:Subject:To:Message-ID:Date:MIME-Version:
         Content-Type;
        b=XPbfRZThXs2mIoqddQgXdrLWkpUXPNvN+GBS3GKPThweOyVOcRsc+xcQDavpz7DIh
         6T9Rl8//bTDFD4VfWNUhIovp1EgnoEIx6bM5R8b6ys+7uAbg97hg86aBhhnzcwy3c3
         RLQcCDkmtp90b7yT0wMCFZJFcSl2oUN3B00/Fvyq44n406DsUC1kjWCQy+DGaKZLkW
         +E6E0PGwgTJ7t6uN7b7hi3a1hVDovIPCrxXK/LScnT0FuUaNPRk2CGhlKi28YL/XPb
         1RAvy8CBfIumqV7qv0HnZAi2fIudiX7tFFm5pgwC7f6CdBqc3yS9OV2Q4ow4POkxhw
         cf/Q4CUO03eUw==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-03v.sys.comcast.net with ESMTPA
        id yIoJhcN5a1GSEyIoRhA0OG; Thu, 15 Aug 2019 16:41:20 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduvddrudefuddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhuffvkffffgggtgfgsehtjeertddtfeejnecuhfhrohhmpeetucfuuhhnuceorghsuddtfeefgiestghomhgtrghsthdrnhgvtheqnecukfhppeejfedrvdegkedrvddvtddrvdduheenucfrrghrrghmpehhvghloheplgduledvrdduieekrdegrdegngdpihhnvghtpeejfedrvdegkedrvddvtddrvdduhedpmhgrihhlfhhrohhmpegrshdutdeffeigsegtohhmtggrshhtrdhnvghtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnsehmvghsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-Xfinity-VMeta: sc=-100;st=legit
From:   A Sun <as1033x@comcast.net>
Subject: [PATCH v1] [media] mceusb: fix (eliminate) TX IR signal length limit
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <c1f26533-20d5-ee4b-18fc-80e7e63a9411@comcast.net>
Date:   Thu, 15 Aug 2019 12:41:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Fix and eliminate mceusb's IR length limit for IR signals transmitted to
the MCE IR blaster ports.

An IR signal TX exceeding 306 pulse/space samples presently causes -EINVAL
return error. There's no such limitation nor error with the MCE device
hardware. And valid IR signals exist with more than 400 pulse/space for the
control of certain appliances (eg Panasonic ACXA75C00600 air conditioner).

The scope of this patch is limited to the mceusb driver. There are still
IR signal TX length and time constraints that related modules of rc core
(eg LIRC) impose, further up the driver stack.

Changes for mceusb_tx_ir():

Converts and sends LIRC IR pulse/space sequence to MCE device IR
pulse/space format.

Break long length LIRC sequence into multiple (unlimited number of) parts
for sending to the MCE device.
Reduce kernel stack IR buffer size: 128 (was 384)
Increase MCE IR data packet size: 31 (was 5)
Zero time LIRC pulse/space no longer copied to MCE IR data.
Eliminate overwriting the source/input LIRC IR data in txbuf[].
Eliminate -EINVAL return; return number of IR samples sent (>0) or
MCE write error code (<0).

New mce_write() and mce_write_callback():

Implements synchronous blocking I/O, with timeout, for writing/sending
data to the MCE device.

An unlimited multipart IR signal sent to the MCE device faster than real
time requires flow control absent with the original mce_request_packet()
and mce_async_callback() asynchronous I/O implementation. Also absent is
TX error feedback.

mce_write() combines and replaces mce_request_packet() and
mce_async_callback() with conversion to synchronous I/O.
mce_write() returns bytes sent (>0) or MCE device write error (<0).
Debug hex dump TX data before processing.

Rename mce_async_out() -> mce_command_out():

The original name is misleading with underlying synchronous I/O
implementation. Function renamed to mce_command_out().

Changes in mceusb_handle_command():

Add support for MCE device error case MCE_RSP_TX_TIMEOUT
"IR TX timeout (TX buffer underrun)"

Changes in mceusb_dev_printdata():

Changes support test and debug of multipart TX IR.

Add buffer boundary information (offset and buffer size) to TX hex dump.
Correct TX trace bug "Raw IR data, 0 pulse/space samples"
Add trace for MCE_RSP_TX_TIMEOUT "IR TX timeout (TX buffer underrun)"

Other changes:

The driver's write to USB device architecture change (async to sync I/O)
is significant so we bump DRIVER_VERSION to "1.95" (from "1.94").

Tests:

$ cat -n irdata1 | head -3
     1  carrier 36000
     2  pulse 6350
     3  space 6350
$ cat -n irdata1 | tail -3
    76  pulse 6350
    77  space 6350
    78  pulse 6350
$ ir-ctl -s irdata1

[1549021.073612] mceusb 1-1.3:1.0: requesting 36000 HZ carrier
[1549021.073635] mceusb 1-1.3:1.0: tx data[0]: 9f 06 01 45 (len=4 sz=4)
[1549021.073649] mceusb 1-1.3:1.0: Request carrier of 35714 Hz (period 28us)
[1549021.073848] mceusb 1-1.3:1.0: tx done status = 4 (wait = 100, expire = 100 (1000ms), urb->actual_length = 4, urb->status = 0)
[1549021.074689] mceusb 1-1.3:1.0: rx data[0]: 9f 06 01 45 (len=4 sz=4)
[1549021.074701] mceusb 1-1.3:1.0: Got carrier of 35714 Hz (period 28us)
[1549021.102023] mceusb 1-1.3:1.0: tx data[0]: 9f 08 03 (len=3 sz=3)
[1549021.102036] mceusb 1-1.3:1.0: Request transmit blaster mask of 0x03
[1549021.102219] mceusb 1-1.3:1.0: tx done status = 3 (wait = 100, expire = 100 (1000ms), urb->actual_length = 3, urb->status = 0)
[1549021.131979] mceusb 1-1.3:1.0: tx data[0]: 9e ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f 9e ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f ff 7f 91 ff (len=81 sz=81)
[1549021.131992] mceusb 1-1.3:1.0: Raw IR data, 30 pulse/space samples
[1549021.133592] mceusb 1-1.3:1.0: tx done status = 81 (wait = 100, expire = 100 (1000ms), urb->actual_length = 81, urb->status = 0)

Hex dumps limited to 64 bytes.
0xff is MCE maximum time pulse, 0x7f is MCE maximum time space.

$ cat -n irdata2 | head -3
     1  carrier 36000
     2  pulse 50
     3  space 50
$ cat -n irdata2 | tail -3
   254  pulse 50
   255  space 50
   256  pulse 50
$ ir-ctl -s irdata2

[1549306.586998] mceusb 1-1.3:1.0: tx data[0]: 9f 08 03 (len=3 sz=3)
[1549306.587015] mceusb 1-1.3:1.0: Request transmit blaster mask of 0x03
[1549306.587252] mceusb 1-1.3:1.0: tx done status = 3 (wait = 100, expire = 100 (1000ms), urb->actual_length = 3, urb->status = 0)
[1549306.613275] mceusb 1-1.3:1.0: tx data[0]: 9e 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 9e 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 9e 81 (len=128 sz=128)
[1549306.613291] mceusb 1-1.3:1.0: Raw IR data, 30 pulse/space samples
[1549306.614837] mceusb 1-1.3:1.0: tx done status = 128 (wait = 100, expire = 100 (1000ms), urb->actual_length = 128, urb->status = 0)
[1549306.614861] mceusb 1-1.3:1.0: tx data[0]: 9e 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 9e 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 01 81 9e 01 (len=128 sz=128)
[1549306.614869] mceusb 1-1.3:1.0: Raw IR data, 30 pulse/space samples
[1549306.620199] mceusb 1-1.3:1.0: tx done status = 128 (wait = 100, expire = 100 (1000ms), urb->actual_length = 128, urb->status = 0)
[1549306.620212] mceusb 1-1.3:1.0: tx data[0]: 89 81 01 81 01 81 01 81 01 81 80 (len=11 sz=11)
[1549306.620221] mceusb 1-1.3:1.0: Raw IR data, 9 pulse/space samples
[1549306.633294] mceusb 1-1.3:1.0: tx done status = 11 (wait = 98, expire = 100 (1000ms), urb->actual_length = 11, urb->status = 0)

Hex dumps limited to 64 bytes.
0x81 is MCE minimum time pulse, 0x01 is MCE minimum time space.
TX IR part 3 sz=11 shows 20msec I/O blocking delay
(100expire - 98wait = 2jiffies)

Signed-off-by: A Sun <as1033x@comcast.net>
---
 drivers/media/rc/mceusb.c | 334 +++++++++++++++++++++++++++-------------------
 1 file changed, 196 insertions(+), 138 deletions(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 8ba1e2b7e..f9ed855e2 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -31,21 +31,22 @@
 #include <linux/pm_wakeup.h>
 #include <media/rc-core.h>
 
-#define DRIVER_VERSION	"1.94"
+#define DRIVER_VERSION	"1.95"
 #define DRIVER_AUTHOR	"Jarod Wilson <jarod@redhat.com>"
 #define DRIVER_DESC	"Windows Media Center Ed. eHome Infrared Transceiver " \
 			"device driver"
 #define DRIVER_NAME	"mceusb"
 
+#define USB_TX_TIMEOUT		1000 /* in milliseconds */
 #define USB_CTRL_MSG_SZ		2  /* Size of usb ctrl msg on gen1 hw */
 #define MCE_G1_INIT_MSGS	40 /* Init messages on gen1 hw to throw out */
 
 /* MCE constants */
-#define MCE_CMDBUF_SIZE		384  /* MCE Command buffer length */
+#define MCE_IRBUF_SIZE		128  /* TX IR buffer length */
 #define MCE_TIME_UNIT		50   /* Approx 50us resolution */
-#define MCE_CODE_LENGTH		5    /* Normal length of packet (with header) */
-#define MCE_PACKET_SIZE		4    /* Normal length of packet (without header) */
-#define MCE_IRDATA_HEADER	0x84 /* Actual header format is 0x80 + num_bytes */
+#define MCE_PACKET_SIZE		31   /* Max length of packet (with header) */
+#define MCE_IRDATA_HEADER	(0x80 + MCE_PACKET_SIZE - 1)
+				     /* Actual format is 0x80 + num_bytes */
 #define MCE_IRDATA_TRAILER	0x80 /* End of IR data */
 #define MCE_MAX_CHANNELS	2    /* Two transmitters, hardware dependent? */
 #define MCE_DEFAULT_TX_MASK	0x03 /* Vals: TX1=0x01, TX2=0x02, ALL=0x03 */
@@ -604,9 +605,9 @@ static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
 	if (len <= skip)
 		return;
 
-	dev_dbg(dev, "%cx data: %*ph (length=%d)",
-		(out ? 't' : 'r'),
-		min(len, buf_len - offset), buf + offset, len);
+	dev_dbg(dev, "%cx data[%d]: %*ph (len=%d sz=%d)",
+		(out ? 't' : 'r'), offset,
+		min(len, buf_len - offset), buf + offset, len, buf_len);
 
 	inout = out ? "Request" : "Got";
 
@@ -728,6 +729,9 @@ static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
 		case MCE_RSP_CMD_ILLEGAL:
 			dev_dbg(dev, "Illegal PORT_IR command");
 			break;
+		case MCE_RSP_TX_TIMEOUT:
+			dev_dbg(dev, "IR TX timeout (TX buffer underrun)");
+			break;
 		default:
 			dev_dbg(dev, "Unknown command 0x%02x 0x%02x",
 				 cmd, subcmd);
@@ -742,13 +746,14 @@ static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
 		dev_dbg(dev, "End of raw IR data");
 	else if ((cmd != MCE_CMD_PORT_IR) &&
 		 ((cmd & MCE_PORT_MASK) == MCE_COMMAND_IRDATA))
-		dev_dbg(dev, "Raw IR data, %d pulse/space samples", ir->rem);
+		dev_dbg(dev, "Raw IR data, %d pulse/space samples",
+			cmd & MCE_PACKET_LENGTH_MASK);
 #endif
 }
 
 /*
  * Schedule work that can't be done in interrupt handlers
- * (mceusb_dev_recv() and mce_async_callback()) nor tasklets.
+ * (mceusb_dev_recv() and mce_write_callback()) nor tasklets.
  * Invokes mceusb_deferred_kevent() for recovering from
  * error events specified by the kevent bit field.
  */
@@ -768,23 +773,80 @@ static void mceusb_defer_kevent(struct mceusb_dev *ir, int kevent)
 		dev_dbg(ir->dev, "kevent %d scheduled", kevent);
 }
 
-static void mce_async_callback(struct urb *urb)
+static void mce_write_callback(struct urb *urb)
 {
-	struct mceusb_dev *ir;
-	int len;
-
 	if (!urb)
 		return;
 
-	ir = urb->context;
+	complete(urb->context);
+}
+
+/*
+ * Write (TX/send) data to MCE device USB endpoint out.
+ * Used for IR blaster TX and MCE device commands.
+ *
+ * Return: The number of bytes written (> 0) or errno (< 0).
+ */
+static int mce_write(struct mceusb_dev *ir, u8 *data, int size)
+{
+	int ret;
+	struct urb *urb;
+	struct device *dev = ir->dev;
+	unsigned char *buf_out;
+	struct completion tx_done;
+	unsigned long expire;
+	unsigned long ret_wait;
+
+	mceusb_dev_printdata(ir, data, size, 0, size, true);
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (unlikely(!urb)) {
+		dev_err(dev, "Error: mce write couldn't allocate urb");
+		return -ENOMEM;
+	}
+
+	buf_out = kmalloc(size, GFP_KERNEL);
+	if (!buf_out) {
+		usb_free_urb(urb);
+		return -ENOMEM;
+	}
+
+	init_completion(&tx_done);
+
+	/* outbound data */
+	if (usb_endpoint_xfer_int(ir->usb_ep_out))
+		usb_fill_int_urb(urb, ir->usbdev, ir->pipe_out,
+				 buf_out, size, mce_write_callback, &tx_done,
+				 ir->usb_ep_out->bInterval);
+	else
+		usb_fill_bulk_urb(urb, ir->usbdev, ir->pipe_out,
+				  buf_out, size, mce_write_callback, &tx_done);
+	memcpy(buf_out, data, size);
+
+	ret = usb_submit_urb(urb, GFP_KERNEL);
+	if (ret) {
+		dev_err(dev, "Error: mce write submit urb error = %d", ret);
+		kfree(buf_out);
+		usb_free_urb(urb);
+		return ret;
+	}
+
+	expire = msecs_to_jiffies(USB_TX_TIMEOUT);
+	ret_wait = wait_for_completion_timeout(&tx_done, expire);
+	if (!ret_wait) {
+		dev_err(dev, "Error: mce write timed out (expire = %lu (%dms))",
+			expire, USB_TX_TIMEOUT);
+		usb_kill_urb(urb);
+		ret = (urb->status == -ENOENT ? -ETIMEDOUT : urb->status);
+	} else {
+		ret = urb->status;
+	}
+	if (ret >= 0)
+		ret = urb->actual_length;	/* bytes written */
 
 	switch (urb->status) {
 	/* success */
 	case 0:
-		len = urb->actual_length;
-
-		mceusb_dev_printdata(ir, urb->transfer_buffer, len,
-				     0, len, true);
 		break;
 
 	case -ECONNRESET:
@@ -794,140 +856,135 @@ static void mce_async_callback(struct urb *urb)
 		break;
 
 	case -EPIPE:
-		dev_err(ir->dev, "Error: request urb status = %d (TX HALT)",
+		dev_err(ir->dev, "Error: mce write urb status = %d (TX HALT)",
 			urb->status);
 		mceusb_defer_kevent(ir, EVENT_TX_HALT);
 		break;
 
 	default:
-		dev_err(ir->dev, "Error: request urb status = %d", urb->status);
+		dev_err(ir->dev, "Error: mce write urb status = %d",
+			urb->status);
 		break;
 	}
 
-	/* the transfer buffer and urb were allocated in mce_request_packet */
-	kfree(urb->transfer_buffer);
-	usb_free_urb(urb);
-}
-
-/* request outgoing (send) usb packet - used to initialize remote */
-static void mce_request_packet(struct mceusb_dev *ir, unsigned char *data,
-								int size)
-{
-	int res;
-	struct urb *async_urb;
-	struct device *dev = ir->dev;
-	unsigned char *async_buf;
+	dev_dbg(dev, "tx done status = %d (wait = %lu, expire = %lu (%dms), urb->actual_length = %d, urb->status = %d)",
+		ret, ret_wait, expire, USB_TX_TIMEOUT,
+		urb->actual_length, urb->status);
 
-	async_urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (unlikely(!async_urb)) {
-		dev_err(dev, "Error, couldn't allocate urb!");
-		return;
-	}
-
-	async_buf = kmalloc(size, GFP_KERNEL);
-	if (!async_buf) {
-		usb_free_urb(async_urb);
-		return;
-	}
-
-	/* outbound data */
-	if (usb_endpoint_xfer_int(ir->usb_ep_out))
-		usb_fill_int_urb(async_urb, ir->usbdev, ir->pipe_out,
-				 async_buf, size, mce_async_callback, ir,
-				 ir->usb_ep_out->bInterval);
-	else
-		usb_fill_bulk_urb(async_urb, ir->usbdev, ir->pipe_out,
-				  async_buf, size, mce_async_callback, ir);
-
-	memcpy(async_buf, data, size);
-
-	dev_dbg(dev, "send request called (size=%#x)", size);
+	kfree(buf_out);
+	usb_free_urb(urb);
 
-	res = usb_submit_urb(async_urb, GFP_ATOMIC);
-	if (res) {
-		dev_err(dev, "send request FAILED! (res=%d)", res);
-		kfree(async_buf);
-		usb_free_urb(async_urb);
-		return;
-	}
-	dev_dbg(dev, "send request complete (res=%d)", res);
+	return ret;
 }
 
-static void mce_async_out(struct mceusb_dev *ir, unsigned char *data, int size)
+static void mce_command_out(struct mceusb_dev *ir, u8 *data, int size)
 {
 	int rsize = sizeof(DEVICE_RESUME);
 
 	if (ir->need_reset) {
 		ir->need_reset = false;
-		mce_request_packet(ir, DEVICE_RESUME, rsize);
+		mce_write(ir, DEVICE_RESUME, rsize);
 		msleep(10);
 	}
 
-	mce_request_packet(ir, data, size);
+	mce_write(ir, data, size);
 	msleep(10);
 }
 
-/* Send data out the IR blaster port(s) */
+/*
+ * Transmit IR out the MCE device IR blaster port(s).
+ *
+ * Convert IR pulse/space sequence from LIRC to MCE format.
+ * Break up a long IR sequence into multiple parts (MCE IR data packets).
+ *
+ * u32 txbuf[] consists of IR pulse, space, ..., and pulse times in usec.
+ * Pulses and spaces are implicit by their position.
+ * The first IR sample, txbuf[0], is always a pulse.
+ *
+ * u8 irbuf[] consists of multiple IR data packets for the MCE device.
+ * A packet is 1 u8 MCE_IRDATA_HEADER and up to 30 u8 IR samples.
+ * An IR sample is 1-bit pulse/space flag with 7-bit time
+ * in MCE time units (50usec).
+ *
+ * Return: The number of IR samples sent (> 0) or errno (< 0).
+ */
 static int mceusb_tx_ir(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 {
 	struct mceusb_dev *ir = dev->priv;
-	int i, length, ret = 0;
-	int cmdcount = 0;
-	unsigned char cmdbuf[MCE_CMDBUF_SIZE];
-
-	/* MCE tx init header */
-	cmdbuf[cmdcount++] = MCE_CMD_PORT_IR;
-	cmdbuf[cmdcount++] = MCE_CMD_SETIRTXPORTS;
-	cmdbuf[cmdcount++] = ir->tx_mask;
+	u8 cmdbuf[3] = { MCE_CMD_PORT_IR, MCE_CMD_SETIRTXPORTS, 0x00 };
+	u8 irbuf[MCE_IRBUF_SIZE];
+	int ircount = 0;
+	unsigned int irsample;
+	int i, length, ret;
 
 	/* Send the set TX ports command */
-	mce_async_out(ir, cmdbuf, cmdcount);
-	cmdcount = 0;
-
-	/* Generate mce packet data */
-	for (i = 0; (i < count) && (cmdcount < MCE_CMDBUF_SIZE); i++) {
-		txbuf[i] = txbuf[i] / MCE_TIME_UNIT;
-
-		do { /* loop to support long pulses/spaces > 127*50us=6.35ms */
-
-			/* Insert mce packet header every 4th entry */
-			if ((cmdcount < MCE_CMDBUF_SIZE) &&
-			    (cmdcount % MCE_CODE_LENGTH) == 0)
-				cmdbuf[cmdcount++] = MCE_IRDATA_HEADER;
-
-			/* Insert mce packet data */
-			if (cmdcount < MCE_CMDBUF_SIZE)
-				cmdbuf[cmdcount++] =
-					(txbuf[i] < MCE_PULSE_BIT ?
-					 txbuf[i] : MCE_MAX_PULSE_LENGTH) |
-					 (i & 1 ? 0x00 : MCE_PULSE_BIT);
-			else {
-				ret = -EINVAL;
-				goto out;
+	cmdbuf[2] = ir->tx_mask;
+	mce_command_out(ir, cmdbuf, sizeof(cmdbuf));
+
+	/* Generate mce IR data packet */
+	for (i = 0; i < count; i++) {
+		irsample = txbuf[i] / MCE_TIME_UNIT;
+
+		/* loop to support long pulses/spaces > 6350us (127*50us) */
+		while (irsample > 0) {
+			/* Insert IR header every 30th entry */
+			if (ircount % MCE_PACKET_SIZE == 0) {
+				/* Room for IR header and one IR sample? */
+				if (ircount >= MCE_IRBUF_SIZE - 1) {
+					/* Send near full buffer */
+					ret = mce_write(ir, irbuf, ircount);
+					if (ret < 0)
+						return ret;
+					ircount = 0;
+				}
+				irbuf[ircount++] = MCE_IRDATA_HEADER;
 			}
 
-		} while ((txbuf[i] > MCE_MAX_PULSE_LENGTH) &&
-			 (txbuf[i] -= MCE_MAX_PULSE_LENGTH));
-	}
-
-	/* Check if we have room for the empty packet at the end */
-	if (cmdcount >= MCE_CMDBUF_SIZE) {
-		ret = -EINVAL;
-		goto out;
-	}
+			/* Insert IR sample */
+			if (irsample <= MCE_MAX_PULSE_LENGTH) {
+				irbuf[ircount] = irsample;
+				irsample = 0;
+			} else {
+				irbuf[ircount] = MCE_MAX_PULSE_LENGTH;
+				irsample -= MCE_MAX_PULSE_LENGTH;
+			}
+			/*
+			 * Even i = IR pulse
+			 * Odd  i = IR space
+			 */
+			irbuf[ircount] |= (i & 1 ? 0 : MCE_PULSE_BIT);
+			ircount++;
+
+			/* IR buffer full? */
+			if (ircount >= MCE_IRBUF_SIZE) {
+				/* Fix packet length in last header */
+				length = ircount % MCE_PACKET_SIZE;
+				if (length > 0)
+					irbuf[ircount - length] -=
+						MCE_PACKET_SIZE - length;
+				/* Send full buffer */
+				ret = mce_write(ir, irbuf, ircount);
+				if (ret < 0)
+					return ret;
+				ircount = 0;
+			}
+		}
+	} /* after for loop, 0 <= ircount < MCE_IRBUF_SIZE */
 
 	/* Fix packet length in last header */
-	length = cmdcount % MCE_CODE_LENGTH;
-	cmdbuf[cmdcount - length] -= MCE_CODE_LENGTH - length;
+	length = ircount % MCE_PACKET_SIZE;
+	if (length > 0)
+		irbuf[ircount - length] -= MCE_PACKET_SIZE - length;
 
-	/* All mce commands end with an empty packet (0x80) */
-	cmdbuf[cmdcount++] = MCE_IRDATA_TRAILER;
+	/* Append IR trailer (0x80) to final partial (or empty) IR buffer */
+	irbuf[ircount++] = MCE_IRDATA_TRAILER;
 
-	/* Transmit the command to the mce device */
-	mce_async_out(ir, cmdbuf, cmdcount);
+	/* Send final buffer */
+	ret = mce_write(ir, irbuf, ircount);
+	if (ret < 0)
+		return ret;
 
-out:
-	return ret ? ret : count;
+	return count;
 }
 
 /* Sets active IR outputs -- mce devices typically have two */
@@ -967,7 +1024,7 @@ static int mceusb_set_tx_carrier(struct rc_dev *dev, u32 carrier)
 			cmdbuf[2] = MCE_CMD_SIG_END;
 			cmdbuf[3] = MCE_IRDATA_TRAILER;
 			dev_dbg(ir->dev, "disabling carrier modulation");
-			mce_async_out(ir, cmdbuf, sizeof(cmdbuf));
+			mce_command_out(ir, cmdbuf, sizeof(cmdbuf));
 			return 0;
 		}
 
@@ -981,7 +1038,7 @@ static int mceusb_set_tx_carrier(struct rc_dev *dev, u32 carrier)
 								carrier);
 
 				/* Transmit new carrier to mce device */
-				mce_async_out(ir, cmdbuf, sizeof(cmdbuf));
+				mce_command_out(ir, cmdbuf, sizeof(cmdbuf));
 				return 0;
 			}
 		}
@@ -1004,10 +1061,10 @@ static int mceusb_set_timeout(struct rc_dev *dev, unsigned int timeout)
 	cmdbuf[2] = units >> 8;
 	cmdbuf[3] = units;
 
-	mce_async_out(ir, cmdbuf, sizeof(cmdbuf));
+	mce_command_out(ir, cmdbuf, sizeof(cmdbuf));
 
 	/* get receiver timeout value */
-	mce_async_out(ir, GET_RX_TIMEOUT, sizeof(GET_RX_TIMEOUT));
+	mce_command_out(ir, GET_RX_TIMEOUT, sizeof(GET_RX_TIMEOUT));
 
 	return 0;
 }
@@ -1032,7 +1089,7 @@ static int mceusb_set_rx_wideband(struct rc_dev *dev, int enable)
 		ir->wideband_rx_enabled = false;
 		cmdbuf[2] = 1;	/* port 1 is long range receiver */
 	}
-	mce_async_out(ir, cmdbuf, sizeof(cmdbuf));
+	mce_command_out(ir, cmdbuf, sizeof(cmdbuf));
 	/* response from device sets ir->learning_active */
 
 	return 0;
@@ -1055,7 +1112,7 @@ static int mceusb_set_rx_carrier_report(struct rc_dev *dev, int enable)
 		ir->carrier_report_enabled = true;
 		if (!ir->learning_active) {
 			cmdbuf[2] = 2;	/* port 2 is short range receiver */
-			mce_async_out(ir, cmdbuf, sizeof(cmdbuf));
+			mce_command_out(ir, cmdbuf, sizeof(cmdbuf));
 		}
 	} else {
 		ir->carrier_report_enabled = false;
@@ -1066,7 +1123,7 @@ static int mceusb_set_rx_carrier_report(struct rc_dev *dev, int enable)
 		 */
 		if (ir->learning_active && !ir->wideband_rx_enabled) {
 			cmdbuf[2] = 1;	/* port 1 is long range receiver */
-			mce_async_out(ir, cmdbuf, sizeof(cmdbuf));
+			mce_command_out(ir, cmdbuf, sizeof(cmdbuf));
 		}
 	}
 
@@ -1145,6 +1202,7 @@ static void mceusb_handle_command(struct mceusb_dev *ir, int index)
 		}
 		break;
 	case MCE_RSP_CMD_ILLEGAL:
+	case MCE_RSP_TX_TIMEOUT:
 		ir->need_reset = true;
 		break;
 	default:
@@ -1283,7 +1341,7 @@ static void mceusb_get_emulator_version(struct mceusb_dev *ir)
 {
 	/* If we get no reply or an illegal command reply, its ver 1, says MS */
 	ir->emver = 1;
-	mce_async_out(ir, GET_EMVER, sizeof(GET_EMVER));
+	mce_command_out(ir, GET_EMVER, sizeof(GET_EMVER));
 }
 
 static void mceusb_gen1_init(struct mceusb_dev *ir)
@@ -1329,10 +1387,10 @@ static void mceusb_gen1_init(struct mceusb_dev *ir)
 	dev_dbg(dev, "set handshake  - retC = %d", ret);
 
 	/* device resume */
-	mce_async_out(ir, DEVICE_RESUME, sizeof(DEVICE_RESUME));
+	mce_command_out(ir, DEVICE_RESUME, sizeof(DEVICE_RESUME));
 
 	/* get hw/sw revision? */
-	mce_async_out(ir, GET_REVISION, sizeof(GET_REVISION));
+	mce_command_out(ir, GET_REVISION, sizeof(GET_REVISION));
 
 	kfree(data);
 }
@@ -1340,13 +1398,13 @@ static void mceusb_gen1_init(struct mceusb_dev *ir)
 static void mceusb_gen2_init(struct mceusb_dev *ir)
 {
 	/* device resume */
-	mce_async_out(ir, DEVICE_RESUME, sizeof(DEVICE_RESUME));
+	mce_command_out(ir, DEVICE_RESUME, sizeof(DEVICE_RESUME));
 
 	/* get wake version (protocol, key, address) */
-	mce_async_out(ir, GET_WAKEVERSION, sizeof(GET_WAKEVERSION));
+	mce_command_out(ir, GET_WAKEVERSION, sizeof(GET_WAKEVERSION));
 
 	/* unknown what this one actually returns... */
-	mce_async_out(ir, GET_UNKNOWN2, sizeof(GET_UNKNOWN2));
+	mce_command_out(ir, GET_UNKNOWN2, sizeof(GET_UNKNOWN2));
 }
 
 static void mceusb_get_parameters(struct mceusb_dev *ir)
@@ -1360,24 +1418,24 @@ static void mceusb_get_parameters(struct mceusb_dev *ir)
 	ir->num_rxports = 2;
 
 	/* get number of tx and rx ports */
-	mce_async_out(ir, GET_NUM_PORTS, sizeof(GET_NUM_PORTS));
+	mce_command_out(ir, GET_NUM_PORTS, sizeof(GET_NUM_PORTS));
 
 	/* get the carrier and frequency */
-	mce_async_out(ir, GET_CARRIER_FREQ, sizeof(GET_CARRIER_FREQ));
+	mce_command_out(ir, GET_CARRIER_FREQ, sizeof(GET_CARRIER_FREQ));
 
 	if (ir->num_txports && !ir->flags.no_tx)
 		/* get the transmitter bitmask */
-		mce_async_out(ir, GET_TX_BITMASK, sizeof(GET_TX_BITMASK));
+		mce_command_out(ir, GET_TX_BITMASK, sizeof(GET_TX_BITMASK));
 
 	/* get receiver timeout value */
-	mce_async_out(ir, GET_RX_TIMEOUT, sizeof(GET_RX_TIMEOUT));
+	mce_command_out(ir, GET_RX_TIMEOUT, sizeof(GET_RX_TIMEOUT));
 
 	/* get receiver sensor setting */
-	mce_async_out(ir, GET_RX_SENSOR, sizeof(GET_RX_SENSOR));
+	mce_command_out(ir, GET_RX_SENSOR, sizeof(GET_RX_SENSOR));
 
 	for (i = 0; i < ir->num_txports; i++) {
 		cmdbuf[2] = i;
-		mce_async_out(ir, cmdbuf, sizeof(cmdbuf));
+		mce_command_out(ir, cmdbuf, sizeof(cmdbuf));
 	}
 }
 
@@ -1386,7 +1444,7 @@ static void mceusb_flash_led(struct mceusb_dev *ir)
 	if (ir->emver < 2)
 		return;
 
-	mce_async_out(ir, FLASH_LED, sizeof(FLASH_LED));
+	mce_command_out(ir, FLASH_LED, sizeof(FLASH_LED));
 }
 
 /*
-- 
2.11.0


