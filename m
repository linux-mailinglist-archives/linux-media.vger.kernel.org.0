Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBD1543AB5
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 19:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbiFHRoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 13:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbiFHRoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 13:44:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314A912F363
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 10:43:58 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7A616CF;
        Wed,  8 Jun 2022 19:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654710236;
        bh=19+b8LQq4zwXdnDx8fHDbtqRtcvfT0agSgi2COYYI3s=;
        h=From:To:Cc:Subject:Date:From;
        b=oECluEymOAR8TRFnhOw2yq7HuXoYFzVT84UY1wIq5uPDAmnnv8u0ALViPCe9iyX1P
         xtbriWanj4wE94pcMxkjQxmMdf92Bkgss7LlG/AjxLL0+0A/XTzc9gWFOy1LsDLjWc
         Zh/x3ghszrnreN1ZNr/B2siEmhamTRUqkU+N+b1w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: uvcvideo: Fix comment blocks style
Date:   Wed,  8 Jun 2022 20:43:48 +0300
Message-Id: <20220608174348.14244-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvcvideo driver historically uses the

/* Comment
 * style
 */

for multi-line block comments, which is frowned upon. Patches for the
driver are required to use the more standard

/*
 * Comment
 * style
 */

style. This result in inconsistencies. Fix it by converting all
remaining instances of the old style.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 33 ++++++----
 drivers/media/usb/uvc/uvc_driver.c | 54 +++++++++++------
 drivers/media/usb/uvc/uvc_isight.c | 13 ++--
 drivers/media/usb/uvc/uvc_queue.c  |  6 +-
 drivers/media/usb/uvc/uvc_status.c |  6 +-
 drivers/media/usb/uvc/uvc_v4l2.c   | 15 +++--
 drivers/media/usb/uvc/uvc_video.c  | 96 ++++++++++++++++++++----------
 drivers/media/usb/uvc/uvcvideo.h   | 15 ++---
 8 files changed, 156 insertions(+), 82 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0e78233fc8a0..e1d57602bc37 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -749,7 +749,8 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 	data[bit >> 3] &= ~(1 << (bit & 7));
 }
 
-/* Extract the bit string specified by mapping->offset and mapping->size
+/*
+ * Extract the bit string specified by mapping->offset and mapping->size
  * from the little-endian data stored at 'data' and return the result as
  * a signed 32bit integer. Sign extension will be performed if the mapping
  * references a signed data type.
@@ -785,7 +786,8 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	return value;
 }
 
-/* Set the bit string specified by mapping->offset and mapping->size
+/*
+ * Set the bit string specified by mapping->offset and mapping->size
  * in the little-endian data stored at 'data' to the value 'value'.
  */
 static void uvc_set_le_value(struct uvc_control_mapping *mapping,
@@ -795,7 +797,8 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	int offset = mapping->offset;
 	u8 mask;
 
-	/* According to the v4l2 spec, writing any value to a button control
+	/*
+	 * According to the v4l2 spec, writing any value to a button control
 	 * should result in the action belonging to the button control being
 	 * triggered. UVC devices however want to see a 1 written -> override
 	 * value.
@@ -927,7 +930,8 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
 			    UVC_VC_EXTENSION_UNIT)
 				return ret;
 
-			/* GET_RES is mandatory for XU controls, but some
+			/*
+			 * GET_RES is mandatory for XU controls, but some
 			 * cameras still choke on it. Ignore errors and set the
 			 * resolution value to zero.
 			 */
@@ -1522,8 +1526,10 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
 				    changes);
-		/* Mark the queue as active, allowing this initial
-		   event to be accepted. */
+		/*
+		 * Mark the queue as active, allowing this initial event to be
+		 * accepted.
+		 */
 		sev->elems = elems;
 		v4l2_event_queue_fh(sev->fh, &ev);
 	}
@@ -1596,7 +1602,8 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 		if (!ctrl->initialized)
 			continue;
 
-		/* Reset the loaded flag for auto-update controls that were
+		/*
+		 * Reset the loaded flag for auto-update controls that were
 		 * marked as loaded in uvc_ctrl_get/uvc_ctrl_set to prevent
 		 * uvc_ctrl_get from using the cached value, and for write-only
 		 * controls to prevent uvc_ctrl_set from setting bits not
@@ -1755,7 +1762,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 			return -ERANGE;
 		value = mapping->menu_info[xctrl->value].value;
 
-		/* Valid menu indices are reported by the GET_RES request for
+		/*
+		 * Valid menu indices are reported by the GET_RES request for
 		 * UVC controls that support it.
 		 */
 		if (mapping->data_type == UVC_CTRL_DATA_TYPE_BITMASK &&
@@ -1779,7 +1787,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		break;
 	}
 
-	/* If the mapping doesn't span the whole UVC control, the current value
+	/*
+	 * If the mapping doesn't span the whole UVC control, the current value
 	 * needs to be loaded from the device to perform the read-modify-write
 	 * operation.
 	 */
@@ -2180,7 +2189,8 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	unsigned int size;
 	unsigned int i;
 
-	/* Most mappings come from static kernel data and need to be duplicated.
+	/*
+	 * Most mappings come from static kernel data and need to be duplicated.
 	 * Mappings that come from userspace will be unnecessarily duplicated,
 	 * this could be optimized.
 	 */
@@ -2389,7 +2399,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	const struct uvc_control_mapping *mend =
 		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
 
-	/* XU controls initialization requires querying the device for control
+	/*
+	 * XU controls initialization requires querying the device for control
 	 * information. As some buggy UVC devices will crash when queried
 	 * repeatedly in a tight loop, delay XU controls initialization until
 	 * first use.
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 6c86faecbea2..77ac5716f99d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -329,7 +329,8 @@ static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coefficients)
 	return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
 }
 
-/* Simplify a fraction using a simple continued fraction decomposition. The
+/*
+ * Simplify a fraction using a simple continued fraction decomposition. The
  * idea here is to convert fractions such as 333333/10000000 to 1/30 using
  * 32 bit arithmetic only. The algorithm is not perfect and relies upon two
  * arbitrary parameters to remove non-significative terms from the simple
@@ -347,7 +348,8 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
 	if (an == NULL)
 		return;
 
-	/* Convert the fraction to a simple continued fraction. See
+	/*
+	 * Convert the fraction to a simple continued fraction. See
 	 * https://mathforum.org/dr.math/faq/faq.fractions.html
 	 * Stop if the current term is bigger than or equal to the given
 	 * threshold.
@@ -383,7 +385,8 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
 	kfree(an);
 }
 
-/* Convert a fraction to a frame interval in 100ns multiples. The idea here is
+/*
+ * Convert a fraction to a frame interval in 100ns multiples. The idea here is
  * to compute numerator / denominator * 10000000 using 32 bit fixed point
  * arithmetic only.
  */
@@ -396,7 +399,8 @@ u32 uvc_fraction_to_interval(u32 numerator, u32 denominator)
 	    numerator/denominator >= ((u32)-1)/10000000)
 		return (u32)-1;
 
-	/* Divide both the denominator and the multiplier by two until
+	/*
+	 * Divide both the denominator and the multiplier by two until
 	 * numerator * multiplier doesn't overflow. If anyone knows a better
 	 * algorithm please let me know.
 	 */
@@ -548,7 +552,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 
 		format->bpp = buffer[21];
 
-		/* Some devices report a format that doesn't match what they
+		/*
+		 * Some devices report a format that doesn't match what they
 		 * really send.
 		 */
 		if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
@@ -663,7 +668,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 	buflen -= buffer[0];
 	buffer += buffer[0];
 
-	/* Parse the frame descriptors. Only uncompressed, MJPEG and frame
+	/*
+	 * Parse the frame descriptors. Only uncompressed, MJPEG and frame
 	 * based formats have frame descriptors.
 	 */
 	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
@@ -705,7 +711,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 		}
 		frame->dwFrameInterval = *intervals;
 
-		/* Several UVC chipsets screw up dwMaxVideoFrameBufferSize
+		/*
+		 * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
 		 * completely. Observed behaviours range from setting the
 		 * value to 1.1x the actual frame size to hardwiring the
 		 * 16 low bits to 0. This results in a higher than necessary
@@ -717,7 +724,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 			frame->dwMaxVideoFrameBufferSize = format->bpp
 				* frame->wWidth * frame->wHeight / 8;
 
-		/* Some bogus devices report dwMinFrameInterval equal to
+		/*
+		 * Some bogus devices report dwMinFrameInterval equal to
 		 * dwMaxFrameInterval and have dwFrameIntervalStep set to
 		 * zero. Setting all null intervals to 1 fixes the problem and
 		 * some other divisions by zero that could happen.
@@ -727,7 +735,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 			*(*intervals)++ = interval ? interval : 1;
 		}
 
-		/* Make sure that the default frame interval stays between
+		/*
+		 * Make sure that the default frame interval stays between
 		 * the boundaries.
 		 */
 		n -= frame->bFrameIntervalType ? 1 : 2;
@@ -819,7 +828,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 		return -ENOMEM;
 	}
 
-	/* The Pico iMage webcam has its class-specific interface descriptors
+	/*
+	 * The Pico iMage webcam has its class-specific interface descriptors
 	 * after the endpoint descriptors.
 	 */
 	if (buflen == 0) {
@@ -918,7 +928,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 			break;
 
 		case UVC_VS_FORMAT_DV:
-			/* DV format has no frame descriptor. We will create a
+			/*
+			 * DV format has no frame descriptor. We will create a
 			 * dummy frame descriptor with a dummy frame interval.
 			 */
 			nformats++;
@@ -1105,7 +1116,8 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
 		if (buffer[1] != 0x41 || buffer[2] != 0x01)
 			break;
 
-		/* Logitech implements several vendor specific functions
+		/*
+		 * Logitech implements several vendor specific functions
 		 * through vendor specific extension units (LXU).
 		 *
 		 * The LXU descriptors are similar to XU descriptors
@@ -1303,7 +1315,8 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		/* Make sure the terminal type MSB is not null, otherwise it
+		/*
+		 * Make sure the terminal type MSB is not null, otherwise it
 		 * could be confused with a unit.
 		 */
 		type = get_unaligned_le16(&buffer[4]);
@@ -1437,7 +1450,8 @@ static int uvc_parse_control(struct uvc_device *dev)
 	int buflen = alts->extralen;
 	int ret;
 
-	/* Parse the default alternate setting only, as the UVC specification
+	/*
+	 * Parse the default alternate setting only, as the UVC specification
 	 * defines a single alternate setting, the default alternate setting
 	 * zero.
 	 */
@@ -1455,7 +1469,8 @@ static int uvc_parse_control(struct uvc_device *dev)
 		buffer += buffer[0];
 	}
 
-	/* Check if the optional status endpoint is present. Built-in iSight
+	/*
+	 * Check if the optional status endpoint is present. Built-in iSight
 	 * webcams have an interrupt endpoint but spit proprietary data that
 	 * don't conform to the UVC status endpoint messages. Don't try to
 	 * handle the interrupt endpoint for those cameras.
@@ -2057,7 +2072,8 @@ static int uvc_scan_device(struct uvc_device *dev)
 		if (!UVC_ENTITY_IS_OTERM(term))
 			continue;
 
-		/* If the terminal is already included in a chain, skip it.
+		/*
+		 * If the terminal is already included in a chain, skip it.
 		 * This can happen for chains that have multiple output
 		 * terminals, where all output terminals beside the first one
 		 * will be inserted in the chain in forward scans.
@@ -2309,7 +2325,8 @@ static int uvc_register_terms(struct uvc_device *dev,
 		if (ret < 0)
 			return ret;
 
-		/* Register a metadata node, but ignore a possible failure,
+		/*
+		 * Register a metadata node, but ignore a possible failure,
 		 * complete registration of video nodes anyway.
 		 */
 		uvc_meta_register(stream);
@@ -2507,7 +2524,8 @@ static void uvc_disconnect(struct usb_interface *intf)
 {
 	struct uvc_device *dev = usb_get_intfdata(intf);
 
-	/* Set the USB interface data to NULL. This can be done outside the
+	/*
+	 * Set the USB interface data to NULL. This can be done outside the
 	 * lock, as there's no other reader.
 	 */
 	usb_set_intfdata(intf, NULL);
diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
index 2578d6ee4829..43cda5e760a3 100644
--- a/drivers/media/usb/uvc/uvc_isight.c
+++ b/drivers/media/usb/uvc/uvc_isight.c
@@ -14,7 +14,8 @@
 
 #include "uvcvideo.h"
 
-/* Built-in iSight webcams implements most of UVC 1.0 except a
+/*
+ * Built-in iSight webcams implements most of UVC 1.0 except a
  * different packet format. Instead of sending a header at the
  * beginning of each isochronous transfer payload, the webcam sends a
  * single header per image (on its own in a packet), followed by
@@ -65,7 +66,8 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
 		buf->state = UVC_BUF_STATE_ACTIVE;
 	}
 
-	/* Mark the buffer as done if we're at the beginning of a new frame.
+	/*
+	 * Mark the buffer as done if we're at the beginning of a new frame.
 	 *
 	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
 	 * as it doesn't make sense to return an empty buffer.
@@ -75,7 +77,8 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
 		return -EAGAIN;
 	}
 
-	/* Copy the video data to the buffer. Skip header packets, as they
+	/*
+	 * Copy the video data to the buffer. Skip header packets, as they
 	 * contain no data.
 	 */
 	if (!is_header) {
@@ -109,7 +112,9 @@ void uvc_video_decode_isight(struct uvc_urb *uvc_urb, struct uvc_buffer *buf,
 				urb->iso_frame_desc[i].status);
 		}
 
-		/* Decode the payload packet.
+		/*
+		 * Decode the payload packet.
+		 *
 		 * uvc_video_decode is entered twice when a frame transition
 		 * has been detected because the end of frame can only be
 		 * reliably detected when the first packet of the new frame
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 21a907d32bb7..16fa17bbd15e 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -135,7 +135,8 @@ static void uvc_buffer_queue(struct vb2_buffer *vb)
 		kref_init(&buf->ref);
 		list_add_tail(&buf->queue, &queue->irqqueue);
 	} else {
-		/* If the device is disconnected return the buffer to userspace
+		/*
+		 * If the device is disconnected return the buffer to userspace
 		 * directly. The next QBUF call will fail with -ENODEV.
 		 */
 		buf->state = UVC_BUF_STATE_ERROR;
@@ -412,7 +413,8 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 
 	spin_lock_irqsave(&queue->irqlock, flags);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
-	/* This must be protected by the irqlock spinlock to avoid race
+	/*
+	 * This must be protected by the irqlock spinlock to avoid race
 	 * conditions between uvc_buffer_queue and the disconnection event that
 	 * could result in an interruptible wait in uvc_dequeue_buffer. Do not
 	 * blindly replace this logic by checking for the UVC_QUEUE_DISCONNECTED
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 753c8226db70..7518ffce22ed 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -202,8 +202,7 @@ static void uvc_status_complete(struct urb *urb)
 	case -ENOENT:		/* usb_kill_urb() called. */
 	case -ECONNRESET:	/* usb_unlink_urb() called. */
 	case -ESHUTDOWN:	/* The endpoint is being disabled. */
-	case -EPROTO:		/* Device is disconnected (reported by some
-				 * host controller). */
+	case -EPROTO:		/* Device is disconnected (reported by some host controllers). */
 		return;
 
 	default:
@@ -272,7 +271,8 @@ int uvc_status_init(struct uvc_device *dev)
 
 	pipe = usb_rcvintpipe(dev->udev, ep->desc.bEndpointAddress);
 
-	/* For high-speed interrupt endpoints, the bInterval value is used as
+	/*
+	 * For high-speed interrupt endpoints, the bInterval value is used as
 	 * an exponent of two. Some developers forgot about it.
 	 */
 	interval = ep->desc.bInterval;
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 648dcd579e81..b36f9cc57cd4 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -63,7 +63,8 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 		break;
 
 	case V4L2_CTRL_TYPE_MENU:
-		/* Prevent excessive memory consumption, as well as integer
+		/*
+		 * Prevent excessive memory consumption, as well as integer
 		 * overflows.
 		 */
 		if (xmap->menu_count == 0 ||
@@ -177,7 +178,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 		fcc[0], fcc[1], fcc[2], fcc[3],
 		fmt->fmt.pix.width, fmt->fmt.pix.height);
 
-	/* Check if the hardware supports the requested format, use the default
+	/*
+	 * Check if the hardware supports the requested format, use the default
 	 * format otherwise.
 	 */
 	for (i = 0; i < stream->nformats; ++i) {
@@ -191,7 +193,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 		fmt->fmt.pix.pixelformat = format->fcc;
 	}
 
-	/* Find the closest image size. The distance between image sizes is
+	/*
+	 * Find the closest image size. The distance between image sizes is
 	 * the size in pixels of the non-overlapping regions between the
 	 * requested size and the frame-specified size.
 	 */
@@ -233,7 +236,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	probe->bFormatIndex = format->index;
 	probe->bFrameIndex = frame->bFrameIndex;
 	probe->dwFrameInterval = uvc_try_frame_interval(frame, interval);
-	/* Some webcams stall the probe control set request when the
+	/*
+	 * Some webcams stall the probe control set request when the
 	 * dwMaxVideoFrameSize field is set to zero. The UVC specification
 	 * clearly states that the field is read-only from the host, so this
 	 * is a webcam bug. Set dwMaxVideoFrameSize to the value reported by
@@ -256,7 +260,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	if (ret < 0)
 		goto done;
 
-	/* After the probe, update fmt with the values returned from
+	/*
+	 * After the probe, update fmt with the values returned from
 	 * negotiation with the device. Some devices return invalid bFormatIndex
 	 * and bFrameIndex values, in which case we can only assume they have
 	 * accepted the requested format as-is.
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 6d3dfa4e0bb2..170a008f4006 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -189,7 +189,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 		ctrl->dwMaxVideoFrameSize =
 			frame->dwMaxVideoFrameBufferSize;
 
-	/* The "TOSHIBA Web Camera - 5M" Chicony device (04f2:b50b) seems to
+	/*
+	 * The "TOSHIBA Web Camera - 5M" Chicony device (04f2:b50b) seems to
 	 * compute the bandwidth on 16 bits and erroneously sign-extend it to
 	 * 32 bits, resulting in a huge bandwidth value. Detect and fix that
 	 * condition by setting the 16 MSBs to 0 when they're all equal to 1.
@@ -207,7 +208,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 			 ? ctrl->dwFrameInterval
 			 : frame->dwFrameInterval[0];
 
-		/* Compute a bandwidth estimation by multiplying the frame
+		/*
+		 * Compute a bandwidth estimation by multiplying the frame
 		 * size by the number of video frames per second, divide the
 		 * result by the number of USB frames (or micro-frames for
 		 * high-speed devices) per second and add the UVC header size
@@ -220,7 +222,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 			bandwidth /= 8;
 		bandwidth += 12;
 
-		/* The bandwidth estimate is too low for many cameras. Don't use
+		/*
+		 * The bandwidth estimate is too low for many cameras. Don't use
 		 * maximum packet sizes lower than 1024 bytes to try and work
 		 * around the problem. According to measurements done on two
 		 * different camera models, the value is high enough to get most
@@ -267,7 +270,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		size, uvc_timeout_param);
 
 	if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
-		/* Some cameras, mostly based on Bison Electronics chipsets,
+		/*
+		 * Some cameras, mostly based on Bison Electronics chipsets,
 		 * answer a GET_MIN or GET_MAX request with the wCompQuality
 		 * field only.
 		 */
@@ -279,7 +283,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		ret = 0;
 		goto out;
 	} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
-		/* Many cameras don't support the GET_DEF request on their
+		/*
+		 * Many cameras don't support the GET_DEF request on their
 		 * video probe control. Warn once and return, the caller will
 		 * fall back to GET_CUR.
 		 */
@@ -322,7 +327,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		ctrl->bMaxVersion = 0;
 	}
 
-	/* Some broken devices return null or wrong dwMaxVideoFrameSize and
+	/*
+	 * Some broken devices return null or wrong dwMaxVideoFrameSize and
 	 * dwMaxPayloadTransferSize fields. Try to get the value from the
 	 * format and frame descriptors.
 	 */
@@ -386,7 +392,8 @@ int uvc_probe_video(struct uvc_streaming *stream,
 	unsigned int i;
 	int ret;
 
-	/* Perform probing. The device should adjust the requested values
+	/*
+	 * Perform probing. The device should adjust the requested values
 	 * according to its capabilities. However, some devices, namely the
 	 * first generation UVC Logitech webcams, don't implement the Video
 	 * Probe control properly, and just return the needed bandwidth. For
@@ -493,7 +500,8 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	if (len < header_size)
 		return;
 
-	/* Extract the timestamps:
+	/*
+	 * Extract the timestamps:
 	 *
 	 * - store the frame PTS in the buffer structure
 	 * - if the SCR field is present, retrieve the host SOF counter and
@@ -506,7 +514,8 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	if (!has_scr)
 		return;
 
-	/* To limit the amount of data, drop SCRs with an SOF identical to the
+	/*
+	 * To limit the amount of data, drop SCRs with an SOF identical to the
 	 * previous one.
 	 */
 	dev_sof = get_unaligned_le16(&data[header_size - 2]);
@@ -518,7 +527,8 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	host_sof = usb_get_current_frame_number(stream->dev->udev);
 	time = uvc_video_get_time();
 
-	/* The UVC specification allows device implementations that can't obtain
+	/*
+	 * The UVC specification allows device implementations that can't obtain
 	 * the USB frame number to keep their own frame counters as long as they
 	 * match the size and frequency of the frame number associated with USB
 	 * SOF tokens. The SOF values sent by such devices differ from the USB
@@ -756,7 +766,8 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 	y1 = NSEC_PER_SEC;
 	y2 = (u32)ktime_to_ns(ktime_sub(last->host_time, first->host_time)) + y1;
 
-	/* Interpolated and host SOF timestamps can wrap around at slightly
+	/*
+	 * Interpolated and host SOF timestamps can wrap around at slightly
 	 * different times. Handle this by adding or removing 2048 to or from
 	 * the computed SOF value to keep it close to the SOF samples mean
 	 * value.
@@ -854,7 +865,8 @@ static void uvc_video_stats_decode(struct uvc_streaming *stream,
 		stream->stats.frame.pts = pts;
 	}
 
-	/* Do all frames have a PTS in their first non-empty packet, or before
+	/*
+	 * Do all frames have a PTS in their first non-empty packet, or before
 	 * their first empty packet ?
 	 */
 	if (stream->stats.frame.size == 0) {
@@ -945,7 +957,8 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 	unsigned int duration;
 	size_t count = 0;
 
-	/* Compute the SCR.SOF frequency estimate. At the nominal 1kHz SOF
+	/*
+	 * Compute the SCR.SOF frequency estimate. At the nominal 1kHz SOF
 	 * frequency this will not overflow before more than 1h.
 	 */
 	duration = ktime_ms_delta(stream->stats.stream.stop_ts,
@@ -997,7 +1010,8 @@ static void uvc_video_stats_stop(struct uvc_streaming *stream)
  * Video codecs
  */
 
-/* Video payload decoding is handled by uvc_video_decode_start(),
+/*
+ * Video payload decoding is handled by uvc_video_decode_start(),
  * uvc_video_decode_data() and uvc_video_decode_end().
  *
  * uvc_video_decode_start is called with URB data at the start of a bulk or
@@ -1037,7 +1051,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 {
 	u8 fid;
 
-	/* Sanity checks:
+	/*
+	 * Sanity checks:
 	 * - packet must be at least 2 bytes long
 	 * - bHeaderLength value must be at least 2 bytes (see above)
 	 * - bHeaderLength value can't be larger than the packet size.
@@ -1049,7 +1064,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 
 	fid = data[1] & UVC_STREAM_FID;
 
-	/* Increase the sequence number regardless of any buffer states, so
+	/*
+	 * Increase the sequence number regardless of any buffer states, so
 	 * that discontinuous sequence numbers always indicate lost frames.
 	 */
 	if (stream->last_fid != fid) {
@@ -1061,7 +1077,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	uvc_video_clock_decode(stream, buf, data, len);
 	uvc_video_stats_decode(stream, data, len);
 
-	/* Store the payload FID bit and return immediately when the buffer is
+	/*
+	 * Store the payload FID bit and return immediately when the buffer is
 	 * NULL.
 	 */
 	if (buf == NULL) {
@@ -1076,7 +1093,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		buf->error = 1;
 	}
 
-	/* Synchronize to the input stream by waiting for the FID bit to be
+	/*
+	 * Synchronize to the input stream by waiting for the FID bit to be
 	 * toggled when the the buffer state is not UVC_BUF_STATE_ACTIVE.
 	 * stream->last_fid is initialized to -1, so the first isochronous
 	 * frame will always be in sync.
@@ -1102,7 +1120,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		buf->state = UVC_BUF_STATE_ACTIVE;
 	}
 
-	/* Mark the buffer as done if we're at the beginning of a new frame.
+	/*
+	 * Mark the buffer as done if we're at the beginning of a new frame.
 	 * End of frame detection is better implemented by checking the EOF
 	 * bit (FID bit toggling is delayed by one frame compared to the EOF
 	 * bit), but some devices don't set the bit at end of frame (and the
@@ -1226,7 +1245,8 @@ static void uvc_video_decode_end(struct uvc_streaming *stream,
 	}
 }
 
-/* Video payload encoding is handled by uvc_video_encode_header() and
+/*
+ * Video payload encoding is handled by uvc_video_encode_header() and
  * uvc_video_encode_data(). Only bulk transfers are currently supported.
  *
  * uvc_video_encode_header is called at the start of a payload. It adds header
@@ -1450,7 +1470,8 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 	len = urb->actual_length;
 	stream->bulk.payload_size += len;
 
-	/* If the URB is the first of its payload, decode and save the
+	/*
+	 * If the URB is the first of its payload, decode and save the
 	 * header.
 	 */
 	if (stream->bulk.header_size == 0 && !stream->bulk.skip_payload) {
@@ -1474,7 +1495,8 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 		}
 	}
 
-	/* The buffer queue might have been cancelled while a bulk transfer
+	/*
+	 * The buffer queue might have been cancelled while a bulk transfer
 	 * was in progress, so we can reach here with buf equal to NULL. Make
 	 * sure buf is never dereferenced if NULL.
 	 */
@@ -1483,7 +1505,8 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 	if (!stream->bulk.skip_payload && buf != NULL)
 		uvc_video_decode_data(uvc_urb, buf, mem, len);
 
-	/* Detect the payload end by a URB smaller than the maximum size (or
+	/*
+	 * Detect the payload end by a URB smaller than the maximum size (or
 	 * a payload size equal to the maximum) and process the header again.
 	 */
 	if (urb->actual_length < urb->transfer_buffer_length ||
@@ -1686,7 +1709,8 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 	if (stream->urb_size)
 		return stream->urb_size / psize;
 
-	/* Compute the number of packets. Bulk endpoints might transfer UVC
+	/*
+	 * Compute the number of packets. Bulk endpoints might transfer UVC
 	 * payloads across multiple URBs.
 	 */
 	npackets = DIV_ROUND_UP(size, psize);
@@ -1975,7 +1999,8 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 		}
 	}
 
-	/* The Logitech C920 temporarily forgets that it should not be adjusting
+	/*
+	 * The Logitech C920 temporarily forgets that it should not be adjusting
 	 * Exposure Absolute during init so restore controls to stored values.
 	 */
 	if (stream->dev->quirks & UVC_QUIRK_RESTORE_CTRLS_ON_INIT)
@@ -2018,7 +2043,8 @@ int uvc_video_resume(struct uvc_streaming *stream, int reset)
 {
 	int ret;
 
-	/* If the bus has been reset on resume, set the alternate setting to 0.
+	/*
+	 * If the bus has been reset on resume, set the alternate setting to 0.
 	 * This should be the default value, but some devices crash or otherwise
 	 * misbehave if they don't receive a SET_INTERFACE request before any
 	 * other video control request.
@@ -2071,14 +2097,16 @@ int uvc_video_init(struct uvc_streaming *stream)
 
 	atomic_set(&stream->active, 0);
 
-	/* Alternate setting 0 should be the default, yet the XBox Live Vision
+	/*
+	 * Alternate setting 0 should be the default, yet the XBox Live Vision
 	 * Cam (and possibly other devices) crash or otherwise misbehave if
 	 * they don't receive a SET_INTERFACE request before any other video
 	 * control request.
 	 */
 	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
 
-	/* Set the streaming probe control with default streaming parameters
+	/*
+	 * Set the streaming probe control with default streaming parameters
 	 * retrieved from the device. Webcams that don't support GET_DEF
 	 * requests on the probe control will just keep their current streaming
 	 * parameters.
@@ -2086,7 +2114,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 	if (uvc_get_video_ctrl(stream, probe, 1, UVC_GET_DEF) == 0)
 		uvc_set_video_ctrl(stream, probe, 1);
 
-	/* Initialize the streaming parameters with the probe control current
+	/*
+	 * Initialize the streaming parameters with the probe control current
 	 * value. This makes sure SET_CUR requests on the streaming commit
 	 * control will always use values retrieved from a successful GET_CUR
 	 * request on the probe control, as required by the UVC specification.
@@ -2095,7 +2124,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 	if (ret < 0)
 		return ret;
 
-	/* Check if the default format descriptor exists. Use the first
+	/*
+	 * Check if the default format descriptor exists. Use the first
 	 * available format otherwise.
 	 */
 	for (i = stream->nformats; i > 0; --i) {
@@ -2110,7 +2140,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 		return -EINVAL;
 	}
 
-	/* Zero bFrameIndex might be correct. Stream-based formats (including
+	/*
+	 * Zero bFrameIndex might be correct. Stream-based formats (including
 	 * MPEG-2 TS and DV) do not support frames but have a dummy frame
 	 * descriptor with bFrameIndex set to zero. If the default frame
 	 * descriptor is not found, use the first available frame.
@@ -2187,7 +2218,8 @@ void uvc_video_stop_streaming(struct uvc_streaming *stream)
 	if (stream->intf->num_altsetting > 1) {
 		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
 	} else {
-		/* UVC doesn't specify how to inform a bulk-based device
+		/*
+		 * UVC doesn't specify how to inform a bulk-based device
 		 * when the video stream is stopped. Windows sends a
 		 * CLEAR_FEATURE(HALT) request to the video streaming
 		 * bulk endpoint, mimic the same behaviour.
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c5b4febd2d94..d2eb107347ea 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -225,7 +225,8 @@ struct gpio_desc;
 struct sg_table;
 struct uvc_device;
 
-/* TODO: Put the most frequently accessed fields at the beginning of
+/*
+ * TODO: Put the most frequently accessed fields at the beginning of
  * structures to maximize cache efficiency.
  */
 struct uvc_control_info {
@@ -270,8 +271,7 @@ struct uvc_control {
 	struct uvc_entity *entity;
 	struct uvc_control_info info;
 
-	u8 index;	/* Used to match the uvc_control entry with a
-			   uvc_control_info. */
+	u8 index;	/* Used to match the uvc_control entry with a uvc_control_info. */
 	u8 dirty:1,
 	   loaded:1,
 	   modified:1,
@@ -289,7 +289,8 @@ struct uvc_format_desc {
 	u32 fcc;
 };
 
-/* The term 'entity' refers to both UVC units and UVC terminals.
+/*
+ * The term 'entity' refers to both UVC units and UVC terminals.
  *
  * The type field is either the terminal type (wTerminalType in the terminal
  * descriptor), or the unit type (bDescriptorSubtype in the unit descriptor).
@@ -308,8 +309,7 @@ struct uvc_format_desc {
 
 struct uvc_entity {
 	struct list_head list;		/* Entity as part of a UVC device. */
-	struct list_head chain;		/* Entity as part of a video device
-					 * chain. */
+	struct list_head chain;		/* Entity as part of a video device chain. */
 	unsigned int flags;
 
 	/*
@@ -591,7 +591,8 @@ struct uvc_streaming {
 	struct uvc_format *cur_format;
 	struct uvc_frame *cur_frame;
 
-	/* Protect access to ctrl, cur_format, cur_frame and hardware video
+	/*
+	 * Protect access to ctrl, cur_format, cur_frame and hardware video
 	 * probe control.
 	 */
 	struct mutex mutex;

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
Regards,

Laurent Pinchart

