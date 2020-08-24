Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFD3250A33
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 22:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgHXUmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 16:42:36 -0400
Received: from gofer.mess.org ([88.97.38.141]:49577 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgHXUmg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 16:42:36 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9A9E3C6416; Mon, 24 Aug 2020 21:42:34 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: rename ir_lirc_* functions to lirc_*
Date:   Mon, 24 Aug 2020 21:42:34 +0100
Message-Id: <20200824204234.335-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove pointless ir_ prefix.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir-mce_kbd-decoder.c |  2 +-
 drivers/media/rc/lirc_dev.c           | 55 +++++++++++++--------------
 drivers/media/rc/rc-core-priv.h       | 20 +++++-----
 drivers/media/rc/rc-ir-raw.c          |  2 +-
 drivers/media/rc/rc-main.c            | 10 ++---
 5 files changed, 44 insertions(+), 45 deletions(-)

diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index 90350f25d8dd..be8f2756a444 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -344,7 +344,7 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		}
 
 		lsc.scancode = scancode;
-		ir_lirc_scancode_event(dev, &lsc);
+		lirc_scancode_event(dev, &lsc);
 		data->state = STATE_INACTIVE;
 		input_event(dev->input_dev, EV_MSC, MSC_SCAN, scancode);
 		input_sync(dev->input_dev);
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index cde817e744b7..e142fb74fcb2 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -30,12 +30,12 @@ static DEFINE_IDA(lirc_ida);
 static struct class *lirc_class;
 
 /**
- * ir_lirc_raw_event() - Send raw IR data to lirc to be relayed to userspace
+ * lirc_raw_event() - Send raw IR data to lirc to be relayed to userspace
  *
  * @dev:	the struct rc_dev descriptor of the device
  * @ev:		the struct ir_raw_event descriptor of the pulse/space
  */
-void ir_lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
+void lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
 {
 	unsigned long flags;
 	struct lirc_fh *fh;
@@ -111,12 +111,12 @@ void ir_lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
 }
 
 /**
- * ir_lirc_scancode_event() - Send scancode data to lirc to be relayed to
+ * lirc_scancode_event() - Send scancode data to lirc to be relayed to
  *		userspace. This can be called in atomic context.
  * @dev:	the struct rc_dev descriptor of the device
  * @lsc:	the struct lirc_scancode describing the decoded scancode
  */
-void ir_lirc_scancode_event(struct rc_dev *dev, struct lirc_scancode *lsc)
+void lirc_scancode_event(struct rc_dev *dev, struct lirc_scancode *lsc)
 {
 	unsigned long flags;
 	struct lirc_fh *fh;
@@ -130,9 +130,9 @@ void ir_lirc_scancode_event(struct rc_dev *dev, struct lirc_scancode *lsc)
 	}
 	spin_unlock_irqrestore(&dev->lirc_fh_lock, flags);
 }
-EXPORT_SYMBOL_GPL(ir_lirc_scancode_event);
+EXPORT_SYMBOL_GPL(lirc_scancode_event);
 
-static int ir_lirc_open(struct inode *inode, struct file *file)
+static int lirc_open(struct inode *inode, struct file *file)
 {
 	struct rc_dev *dev = container_of(inode->i_cdev, struct rc_dev,
 					  lirc_cdev);
@@ -200,7 +200,7 @@ static int ir_lirc_open(struct inode *inode, struct file *file)
 	return retval;
 }
 
-static int ir_lirc_close(struct inode *inode, struct file *file)
+static int lirc_close(struct inode *inode, struct file *file)
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *dev = fh->rc;
@@ -222,8 +222,8 @@ static int ir_lirc_close(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
-				   size_t n, loff_t *ppos)
+static ssize_t lirc_transmit_ir(struct file *file, const char __user *buf,
+				size_t n, loff_t *ppos)
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *dev = fh->rc;
@@ -363,8 +363,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
 	return ret;
 }
 
-static long ir_lirc_ioctl(struct file *file, unsigned int cmd,
-			  unsigned long arg)
+static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *dev = fh->rc;
@@ -586,7 +585,7 @@ static long ir_lirc_ioctl(struct file *file, unsigned int cmd,
 	return ret;
 }
 
-static __poll_t ir_lirc_poll(struct file *file, struct poll_table_struct *wait)
+static __poll_t lirc_poll(struct file *file, struct poll_table_struct *wait)
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *rcdev = fh->rc;
@@ -609,8 +608,8 @@ static __poll_t ir_lirc_poll(struct file *file, struct poll_table_struct *wait)
 	return events;
 }
 
-static ssize_t ir_lirc_read_mode2(struct file *file, char __user *buffer,
-				  size_t length)
+static ssize_t lirc_read_mode2(struct file *file, char __user *buffer,
+			       size_t length)
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *rcdev = fh->rc;
@@ -647,8 +646,8 @@ static ssize_t ir_lirc_read_mode2(struct file *file, char __user *buffer,
 	return copied;
 }
 
-static ssize_t ir_lirc_read_scancode(struct file *file, char __user *buffer,
-				     size_t length)
+static ssize_t lirc_read_scancode(struct file *file, char __user *buffer,
+				  size_t length)
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *rcdev = fh->rc;
@@ -686,8 +685,8 @@ static ssize_t ir_lirc_read_scancode(struct file *file, char __user *buffer,
 	return copied;
 }
 
-static ssize_t ir_lirc_read(struct file *file, char __user *buffer,
-			    size_t length, loff_t *ppos)
+static ssize_t lirc_read(struct file *file, char __user *buffer, size_t length,
+			 loff_t *ppos)
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *rcdev = fh->rc;
@@ -699,20 +698,20 @@ static ssize_t ir_lirc_read(struct file *file, char __user *buffer,
 		return -ENODEV;
 
 	if (fh->rec_mode == LIRC_MODE_MODE2)
-		return ir_lirc_read_mode2(file, buffer, length);
+		return lirc_read_mode2(file, buffer, length);
 	else /* LIRC_MODE_SCANCODE */
-		return ir_lirc_read_scancode(file, buffer, length);
+		return lirc_read_scancode(file, buffer, length);
 }
 
 static const struct file_operations lirc_fops = {
 	.owner		= THIS_MODULE,
-	.write		= ir_lirc_transmit_ir,
-	.unlocked_ioctl	= ir_lirc_ioctl,
+	.write		= lirc_transmit_ir,
+	.unlocked_ioctl	= lirc_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
-	.read		= ir_lirc_read,
-	.poll		= ir_lirc_poll,
-	.open		= ir_lirc_open,
-	.release	= ir_lirc_close,
+	.read		= lirc_read,
+	.poll		= lirc_poll,
+	.open		= lirc_open,
+	.release	= lirc_close,
 	.llseek		= no_llseek,
 };
 
@@ -723,7 +722,7 @@ static void lirc_release_device(struct device *ld)
 	put_device(&rcdev->dev);
 }
 
-int ir_lirc_register(struct rc_dev *dev)
+int lirc_register(struct rc_dev *dev)
 {
 	const char *rx_type, *tx_type;
 	int err, minor;
@@ -777,7 +776,7 @@ int ir_lirc_register(struct rc_dev *dev)
 	return err;
 }
 
-void ir_lirc_unregister(struct rc_dev *dev)
+void lirc_unregister(struct rc_dev *dev)
 {
 	unsigned long flags;
 	struct lirc_fh *fh;
diff --git a/drivers/media/rc/rc-core-priv.h b/drivers/media/rc/rc-core-priv.h
index a59c6c416a18..62f032dffd33 100644
--- a/drivers/media/rc/rc-core-priv.h
+++ b/drivers/media/rc/rc-core-priv.h
@@ -321,20 +321,20 @@ void ir_raw_init(void);
 #ifdef CONFIG_LIRC
 int lirc_dev_init(void);
 void lirc_dev_exit(void);
-void ir_lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev);
-void ir_lirc_scancode_event(struct rc_dev *dev, struct lirc_scancode *lsc);
-int ir_lirc_register(struct rc_dev *dev);
-void ir_lirc_unregister(struct rc_dev *dev);
+void lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev);
+void lirc_scancode_event(struct rc_dev *dev, struct lirc_scancode *lsc);
+int lirc_register(struct rc_dev *dev);
+void lirc_unregister(struct rc_dev *dev);
 struct rc_dev *rc_dev_get_from_fd(int fd);
 #else
 static inline int lirc_dev_init(void) { return 0; }
 static inline void lirc_dev_exit(void) {}
-static inline void ir_lirc_raw_event(struct rc_dev *dev,
-				     struct ir_raw_event ev) { }
-static inline void ir_lirc_scancode_event(struct rc_dev *dev,
-					  struct lirc_scancode *lsc) { }
-static inline int ir_lirc_register(struct rc_dev *dev) { return 0; }
-static inline void ir_lirc_unregister(struct rc_dev *dev) { }
+static inline void lirc_raw_event(struct rc_dev *dev,
+				  struct ir_raw_event ev) { }
+static inline void lirc_scancode_event(struct rc_dev *dev,
+				       struct lirc_scancode *lsc) { }
+static inline int lirc_register(struct rc_dev *dev) { return 0; }
+static inline void lirc_unregister(struct rc_dev *dev) { }
 #endif
 
 /*
diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index b3c86b98f4f9..d972b5a2774d 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -42,7 +42,7 @@ static int ir_raw_event_thread(void *data)
 				if (dev->enabled_protocols &
 				    handler->protocols || !handler->protocols)
 					handler->decode(dev, ev);
-			ir_lirc_raw_event(dev, ev);
+			lirc_raw_event(dev, ev);
 			raw->prev_ev = ev;
 		}
 		mutex_unlock(&ir_raw_handler_lock);
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index dee8a9f3d80a..1d811e5ffb55 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -747,7 +747,7 @@ void rc_repeat(struct rc_dev *dev)
 	};
 
 	if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
-		ir_lirc_scancode_event(dev, &sc);
+		lirc_scancode_event(dev, &sc);
 
 	spin_lock_irqsave(&dev->keylock, flags);
 
@@ -791,7 +791,7 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
 	};
 
 	if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
-		ir_lirc_scancode_event(dev, &sc);
+		lirc_scancode_event(dev, &sc);
 
 	if (new_event && dev->keypressed)
 		ir_do_keyup(dev, false);
@@ -1946,7 +1946,7 @@ int rc_register_device(struct rc_dev *dev)
 	 * keycodes with rc_keydown, so lirc must be registered first.
 	 */
 	if (dev->allowed_protocols != RC_PROTO_BIT_CEC) {
-		rc = ir_lirc_register(dev);
+		rc = lirc_register(dev);
 		if (rc < 0)
 			goto out_dev;
 	}
@@ -1972,7 +1972,7 @@ int rc_register_device(struct rc_dev *dev)
 	rc_free_rx_device(dev);
 out_lirc:
 	if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
-		ir_lirc_unregister(dev);
+		lirc_unregister(dev);
 out_dev:
 	device_del(&dev->dev);
 out_rx_free:
@@ -2036,7 +2036,7 @@ void rc_unregister_device(struct rc_dev *dev)
 	 * that userspace polling will get notified.
 	 */
 	if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
-		ir_lirc_unregister(dev);
+		lirc_unregister(dev);
 
 	device_del(&dev->dev);
 
-- 
2.26.2

