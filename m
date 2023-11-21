Return-Path: <linux-media+bounces-640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA27F26A5
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 08:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895DC1C20D64
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 07:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E365C36B15;
	Tue, 21 Nov 2023 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5F9328D5
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 07:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED82BC433C7;
	Tue, 21 Nov 2023 07:49:07 +0000 (UTC)
Message-ID: <69b1537c-73cb-4913-a6f4-b4ac3b50588d@xs4all.nl>
Date: Tue, 21 Nov 2023 08:49:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] media: v4l2-ctrls: add support for fraction_bits
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This adds support for the fraction_bits field, used with integer controls.
This allows fixed point formats to be described.

The fraction_bits field is only exposed through VIDIOC_QUERY_EXT_CTRL.

For a given signed two's complement Qf fixed point value 'f' equals
fraction_bits.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes in v2: use div64_s64

This is the cleaned up version of my earlier RFC patch.

Shengjiu, for your next patch series just use this patch.

Note that I dropped the inline helpers in videodev2.h, but I am not sure
if there shouldn't still be a helper added to include/media/v4l2-ctrls.h
in order to fill in a fixed point value.

Regards,

	Hans
---
 .../media/v4l/vidioc-queryctrl.rst            | 11 ++-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 93 +++++++++++++++----
 include/media/v4l2-ctrls.h                    |  7 +-
 include/uapi/linux/videodev2.h                |  3 +-
 5 files changed, 95 insertions(+), 20 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..e65c7e5d78ec 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -267,7 +267,16 @@ See also the examples in :ref:`control`.
       - The size of each dimension. The first ``nr_of_dims`` elements of
 	this array must be non-zero, all remaining elements must be zero.
     * - __u32
-      - ``reserved``\ [32]
+      - ``fraction_bits``
+      - The number of least significant bits of the control value that
+        form the fraction of the fixed point value. This is 0 if the value
+	is a regular integer. This can be used with all integer control types
+	(``INTEGER``, ``INTEGER64``, ``U8``, ``U16`` and ``U32``).
+	For the signed types the signed two's complement representation is used.
+	This field applies to the control value as well as the ``minimum``,
+	``maximum``, ``step`` and ``default_value`` fields.
+    * - __u32
+      - ``reserved``\ [31]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 002ea6588edf..3132df315b17 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1101,6 +1101,7 @@ int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctr
 	qc->elems = ctrl->elems;
 	qc->nr_of_dims = ctrl->nr_of_dims;
 	memcpy(qc->dims, ctrl->dims, qc->nr_of_dims * sizeof(qc->dims[0]));
+	qc->fraction_bits = ctrl->fraction_bits;
 	qc->minimum = ctrl->minimum;
 	qc->maximum = ctrl->maximum;
 	qc->default_value = ctrl->default_value;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index a662fb60f73f..b86ceaaacbd7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -252,12 +252,61 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 }
 EXPORT_SYMBOL(v4l2_ctrl_type_op_init);

+static void v4l2_ctrl_log_fp(s64 v, unsigned int fraction_bits)
+{
+	s64 i, f, mask;
+
+	if (!fraction_bits) {
+		pr_cont("%lld", v);
+		return;
+	}
+
+	mask = (1ULL << fraction_bits) - 1;
+
+	/*
+	 * Note: this function does not support fixed point u64 with
+	 * fraction_bits set to 64. At the moment there is no U64
+	 * control type, but if that is added, then this code will have
+	 * to add support for it.
+	 */
+	if (fraction_bits >= 63)
+		i = v < 0 ? -1 : 0;
+	else
+		i = div64_s64(v, 1LL << fraction_bits);
+
+	f = v < 0 ? -((-v) & mask) : (v & mask);
+
+	if (!f) {
+		pr_cont("%lld", i);
+	} else if (fraction_bits < 20) {
+		u64 div = 1ULL << fraction_bits;
+
+		if (!i && f < 0)
+			pr_cont("-%lld/%llu", -f, div);
+		else if (!i)
+			pr_cont("%lld/%llu", f, div);
+		else if (i < 0 || f < 0)
+			pr_cont("-%lld-%llu/%llu", -i, -f, div);
+		else
+			pr_cont("%lld+%llu/%llu", i, f, div);
+	} else {
+		if (!i && f < 0)
+			pr_cont("-%lld/(2^%u)", -f, fraction_bits);
+		else if (!i)
+			pr_cont("%lld/(2^%u)", f, fraction_bits);
+		else if (i < 0 || f < 0)
+			pr_cont("-%lld-%llu/(2^%u)", -i, -f, fraction_bits);
+		else
+			pr_cont("%lld+%llu/(2^%u)", i, f, fraction_bits);
+	}
+}
+
 void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;

 	if (ctrl->is_array) {
-		unsigned i;
+		unsigned int i;

 		for (i = 0; i < ctrl->nr_of_dims; i++)
 			pr_cont("[%u]", ctrl->dims[i]);
@@ -266,7 +315,7 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)

 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER:
-		pr_cont("%d", *ptr.p_s32);
+		v4l2_ctrl_log_fp(*ptr.p_s32, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		pr_cont("%s", *ptr.p_s32 ? "true" : "false");
@@ -281,19 +330,19 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 		pr_cont("0x%08x", *ptr.p_s32);
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
-		pr_cont("%lld", *ptr.p_s64);
+		v4l2_ctrl_log_fp(*ptr.p_s64, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_STRING:
 		pr_cont("%s", ptr.p_char);
 		break;
 	case V4L2_CTRL_TYPE_U8:
-		pr_cont("%u", (unsigned)*ptr.p_u8);
+		v4l2_ctrl_log_fp(*ptr.p_u8, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_U16:
-		pr_cont("%u", (unsigned)*ptr.p_u16);
+		v4l2_ctrl_log_fp(*ptr.p_u16, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_U32:
-		pr_cont("%u", (unsigned)*ptr.p_u32);
+		v4l2_ctrl_log_fp(*ptr.p_u32, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_H264_SPS:
 		pr_cont("H264_SPS");
@@ -1752,11 +1801,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			u32 id, const char *name, enum v4l2_ctrl_type type,
 			s64 min, s64 max, u64 step, s64 def,
 			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
-			u32 flags, const char * const *qmenu,
+			u32 fraction_bits, u32 flags, const char * const *qmenu,
 			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
 			void *priv)
 {
 	struct v4l2_ctrl *ctrl;
+	unsigned int max_fraction_bits = 0;
 	unsigned sz_extra;
 	unsigned nr_of_dims = 0;
 	unsigned elems = 1;
@@ -1778,20 +1828,28 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,

 	/* Prefill elem_size for all types handled by std_type_ops */
 	switch ((u32)type) {
+	case V4L2_CTRL_TYPE_INTEGER:
+		elem_size = sizeof(s32);
+		max_fraction_bits = 31;
+		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
 		elem_size = sizeof(s64);
+		max_fraction_bits = 63;
 		break;
 	case V4L2_CTRL_TYPE_STRING:
 		elem_size = max + 1;
 		break;
 	case V4L2_CTRL_TYPE_U8:
 		elem_size = sizeof(u8);
+		max_fraction_bits = 8;
 		break;
 	case V4L2_CTRL_TYPE_U16:
 		elem_size = sizeof(u16);
+		max_fraction_bits = 16;
 		break;
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
+		max_fraction_bits = 32;
 		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
@@ -1875,10 +1933,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}

 	/* Sanity checks */
-	if (id == 0 || name == NULL || !elem_size ||
-	    id >= V4L2_CID_PRIVATE_BASE ||
-	    (type == V4L2_CTRL_TYPE_MENU && qmenu == NULL) ||
-	    (type == V4L2_CTRL_TYPE_INTEGER_MENU && qmenu_int == NULL)) {
+	if (id == 0 || !name || !elem_size ||
+	    fraction_bits > max_fraction_bits || id >= V4L2_CID_PRIVATE_BASE ||
+	    (type == V4L2_CTRL_TYPE_MENU && !qmenu) ||
+	    (type == V4L2_CTRL_TYPE_INTEGER_MENU && !qmenu_int)) {
 		handler_set_err(hdl, -ERANGE);
 		return NULL;
 	}
@@ -1939,6 +1997,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->name = name;
 	ctrl->type = type;
 	ctrl->flags = flags;
+	ctrl->fraction_bits = fraction_bits;
 	ctrl->minimum = min;
 	ctrl->maximum = max;
 	ctrl->step = step;
@@ -2037,7 +2096,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 	ctrl = v4l2_ctrl_new(hdl, cfg->ops, cfg->type_ops, cfg->id, name,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
-			cfg->dims, cfg->elem_size,
+			cfg->dims, cfg->elem_size, cfg->fraction_bits,
 			flags, qmenu, qmenu_int, cfg->p_def, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
@@ -2062,7 +2121,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     min, max, step, def, NULL, 0,
+			     min, max, step, def, NULL, 0, 0,
 			     flags, NULL, NULL, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
@@ -2095,7 +2154,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     0, max, mask, def, NULL, 0,
+			     0, max, mask, def, NULL, 0, 0,
 			     flags, qmenu, qmenu_int, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
@@ -2127,7 +2186,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     0, max, mask, def, NULL, 0,
+			     0, max, mask, def, NULL, 0, 0,
 			     flags, qmenu, NULL, ptr_null, NULL);

 }
@@ -2149,7 +2208,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     min, max, step, def, NULL, 0,
+			     min, max, step, def, NULL, 0, 0,
 			     flags, NULL, NULL, p_def, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
@@ -2173,7 +2232,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     0, max, 0, def, NULL, 0,
+			     0, max, 0, def, NULL, 0, 0,
 			     flags, NULL, qmenu_int, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..c35514c5bf88 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -211,7 +211,8 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		except for dynamic arrays. In that case it is in the range of
  *		1 to @p_array_alloc_elems.
  * @dims:	The size of each dimension.
- * @nr_of_dims:The number of dimensions in @dims.
+ * @nr_of_dims: The number of dimensions in @dims.
+ * @fraction_bits: The number of fraction bits for fixed point values.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
  *		easy to skip menu items that are not valid. If bit X is set,
  *		then menu item X is skipped. Of course, this only works for
@@ -228,6 +229,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		:math:`ceil(\frac{maximum - minimum}{step}) + 1`.
  *		Used only if the @type is %V4L2_CTRL_TYPE_INTEGER_MENU.
  * @flags:	The control's flags.
+ * @fraction_bits: The number of fraction bits for fixed point values.
  * @priv:	The control's private pointer. For use by the driver. It is
  *		untouched by the control framework. Note that this pointer is
  *		not freed when the control is deleted. Should this be needed
@@ -286,6 +288,7 @@ struct v4l2_ctrl {
 	u32 new_elems;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 nr_of_dims;
+	u32 fraction_bits;
 	union {
 		u64 step;
 		u64 menu_skip_mask;
@@ -426,6 +429,7 @@ struct v4l2_ctrl_handler {
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
+ * @fraction_bits: The number of fraction bits for fixed point values.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
  *		easy to skip menu items that are not valid. If bit X is set,
  *		then menu item X is skipped. Of course, this only works for
@@ -455,6 +459,7 @@ struct v4l2_ctrl_config {
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
+	u32 fraction_bits;
 	u64 menu_skip_mask;
 	const char * const *qmenu;
 	const s64 *qmenu_int;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3d4e490ce7c..3813212a5cd3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1944,7 +1944,8 @@ struct v4l2_query_ext_ctrl {
 	__u32                elems;
 	__u32                nr_of_dims;
 	__u32                dims[V4L2_CTRL_MAX_DIMS];
-	__u32		     reserved[32];
+	__u32                fraction_bits;
+	__u32		     reserved[31];
 };

 /*  Used in the VIDIOC_QUERYMENU ioctl for querying menu items */
-- 
2.42.0


