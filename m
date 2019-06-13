Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C53E94382F
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732832AbfFMPEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:04:04 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39624 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732473AbfFMOSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 10:18:47 -0400
Received: from [109.168.11.45] (port=39754 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hbQYs-0005He-EY; Thu, 13 Jun 2019 16:18:42 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 7/9] media: docs: v4l2-controls: convert code blocks to C
Date:   Thu, 13 Jun 2019 16:18:24 +0200
Message-Id: <20190613141826.26775-7-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613141826.26775-1-luca@lucaceresoli.net>
References: <20190613141826.26775-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All these code blocks contain C code, enable C formatting for a nicer
reading.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/media/kapi/v4l2-controls.rst | 74 +++++++++++-----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
index 41c0fd4009e9..45541e05a0e7 100644
--- a/Documentation/media/kapi/v4l2-controls.rst
+++ b/Documentation/media/kapi/v4l2-controls.rst
@@ -54,7 +54,7 @@ Basic usage for V4L2 and sub-device drivers
 
 For V4L2 drivers:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct foo_dev {
 		...
@@ -66,7 +66,7 @@ For V4L2 drivers:
 
 For sub-device drivers:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct foo_dev {
 		...
@@ -78,7 +78,7 @@ For sub-device drivers:
 
 1.2) Initialize the handler:
 
-.. code-block:: none
+.. code-block:: c
 
 	v4l2_ctrl_handler_init(&foo->ctrl_handler, nr_of_controls);
 
@@ -90,7 +90,7 @@ information. It is a hint only.
 
 For V4L2 drivers:
 
-.. code-block:: none
+.. code-block:: c
 
 	foo->v4l2_dev.ctrl_handler = &foo->ctrl_handler;
 
@@ -101,13 +101,13 @@ Those are now no longer needed.
 
 For sub-device drivers:
 
-.. code-block:: none
+.. code-block:: c
 
 	foo->sd.ctrl_handler = &foo->ctrl_handler;
 
 1.4) Clean up the handler at the end:
 
-.. code-block:: none
+.. code-block:: c
 
 	v4l2_ctrl_handler_free(&foo->ctrl_handler);
 
@@ -116,7 +116,7 @@ For sub-device drivers:
 
 You add non-menu controls by calling :c:func:`v4l2_ctrl_new_std`:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 			const struct v4l2_ctrl_ops *ops,
@@ -125,7 +125,7 @@ You add non-menu controls by calling :c:func:`v4l2_ctrl_new_std`:
 Menu and integer menu controls are added by calling
 :c:func:`v4l2_ctrl_new_std_menu`:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 			const struct v4l2_ctrl_ops *ops,
@@ -134,7 +134,7 @@ Menu and integer menu controls are added by calling
 Menu controls with a driver specific menu are added by calling
 :c:func:`v4l2_ctrl_new_std_menu_items`:
 
-.. code-block:: none
+.. code-block:: c
 
        struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(
                        struct v4l2_ctrl_handler *hdl,
@@ -144,7 +144,7 @@ Menu controls with a driver specific menu are added by calling
 Integer menu controls with a driver specific menu can be added by calling
 :c:func:`v4l2_ctrl_new_int_menu`:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 			const struct v4l2_ctrl_ops *ops,
@@ -153,7 +153,7 @@ Integer menu controls with a driver specific menu can be added by calling
 These functions are typically called right after the
 :c:func:`v4l2_ctrl_handler_init`:
 
-.. code-block:: none
+.. code-block:: c
 
 	static const s64 exp_bias_qmenu[] = {
 	       -2, -1, 0, 1, 2
@@ -232,7 +232,7 @@ a bit faster that way.
 
 3) Optionally force initial control setup:
 
-.. code-block:: none
+.. code-block:: c
 
 	v4l2_ctrl_handler_setup(&foo->ctrl_handler);
 
@@ -243,7 +243,7 @@ the hardware are in sync.
 
 4) Finally: implement the :c:type:`v4l2_ctrl_ops`
 
-.. code-block:: none
+.. code-block:: c
 
 	static const struct v4l2_ctrl_ops foo_ctrl_ops = {
 		.s_ctrl = foo_s_ctrl,
@@ -251,7 +251,7 @@ the hardware are in sync.
 
 Usually all you need is s_ctrl:
 
-.. code-block:: none
+.. code-block:: c
 
 	static int foo_s_ctrl(struct v4l2_ctrl *ctrl)
 	{
@@ -304,7 +304,7 @@ Accessing Control Values
 The following union is used inside the control framework to access control
 values:
 
-.. code-block:: none
+.. code-block:: c
 
 	union v4l2_ctrl_ptr {
 		s32 *p_s32;
@@ -316,7 +316,7 @@ values:
 The v4l2_ctrl struct contains these fields that can be used to access both
 current and new values:
 
-.. code-block:: none
+.. code-block:: c
 
 	s32 val;
 	struct {
@@ -329,7 +329,7 @@ current and new values:
 
 If the control has a simple s32 type type, then:
 
-.. code-block:: none
+.. code-block:: c
 
 	&ctrl->val == ctrl->p_new.p_s32
 	&ctrl->cur.val == ctrl->p_cur.p_s32
@@ -353,7 +353,7 @@ exception is for controls that return a volatile register such as a signal
 strength read-out that changes continuously. In that case you will need to
 implement g_volatile_ctrl like this:
 
-.. code-block:: none
+.. code-block:: c
 
 	static int foo_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	{
@@ -371,7 +371,7 @@ changes.
 
 To mark a control as volatile you have to set V4L2_CTRL_FLAG_VOLATILE:
 
-.. code-block:: none
+.. code-block:: c
 
 	ctrl = v4l2_ctrl_new_std(&sd->ctrl_handler, ...);
 	if (ctrl)
@@ -392,7 +392,7 @@ not to introduce deadlocks.
 Outside of the control ops you have to go through to helper functions to get
 or set a single control value safely in your driver:
 
-.. code-block:: none
+.. code-block:: c
 
 	s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl);
 	int v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val);
@@ -403,7 +403,7 @@ will result in a deadlock since these helpers lock the handler as well.
 
 You can also take the handler lock yourself:
 
-.. code-block:: none
+.. code-block:: c
 
 	mutex_lock(&state->ctrl_handler.lock);
 	pr_info("String value is '%s'\n", ctrl1->p_cur.p_char);
@@ -416,7 +416,7 @@ Menu Controls
 
 The v4l2_ctrl struct contains this union:
 
-.. code-block:: none
+.. code-block:: c
 
 	union {
 		u32 step;
@@ -444,7 +444,7 @@ Custom Controls
 
 Driver specific controls can be created using v4l2_ctrl_new_custom():
 
-.. code-block:: none
+.. code-block:: c
 
 	static const struct v4l2_ctrl_config ctrl_filter = {
 		.ops = &ctrl_custom_ops,
@@ -498,7 +498,7 @@ By default all controls are independent from the others. But in more
 complex scenarios you can get dependencies from one control to another.
 In that case you need to 'cluster' them:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct foo {
 		struct v4l2_ctrl_handler ctrl_handler;
@@ -522,7 +522,7 @@ composite control. Similar to how a 'struct' works in C.
 So when s_ctrl is called with V4L2_CID_AUDIO_VOLUME as argument, you should set
 all two controls belonging to the audio_cluster:
 
-.. code-block:: none
+.. code-block:: c
 
 	static int foo_s_ctrl(struct v4l2_ctrl *ctrl)
 	{
@@ -544,7 +544,7 @@ all two controls belonging to the audio_cluster:
 
 In the example above the following are equivalent for the VOLUME case:
 
-.. code-block:: none
+.. code-block:: c
 
 	ctrl == ctrl->cluster[AUDIO_CL_VOLUME] == state->audio_cluster[AUDIO_CL_VOLUME]
 	ctrl->cluster[AUDIO_CL_MUTE] == state->audio_cluster[AUDIO_CL_MUTE]
@@ -552,7 +552,7 @@ In the example above the following are equivalent for the VOLUME case:
 In practice using cluster arrays like this becomes very tiresome. So instead
 the following equivalent method is used:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct {
 		/* audio cluster */
@@ -564,7 +564,7 @@ The anonymous struct is used to clearly 'cluster' these two control pointers,
 but it serves no other purpose. The effect is the same as creating an
 array with two control pointers. So you can just do:
 
-.. code-block:: none
+.. code-block:: c
 
 	state->volume = v4l2_ctrl_new_std(&state->ctrl_handler, ...);
 	state->mute = v4l2_ctrl_new_std(&state->ctrl_handler, ...);
@@ -620,7 +620,7 @@ changing that control affects the control flags of the manual controls.
 In order to simplify this a special variation of v4l2_ctrl_cluster was
 introduced:
 
-.. code-block:: none
+.. code-block:: c
 
 	void v4l2_ctrl_auto_cluster(unsigned ncontrols, struct v4l2_ctrl **controls,
 				    u8 manual_val, bool set_volatile);
@@ -675,7 +675,7 @@ of another handler (e.g. for a video device node), then you should first add
 the controls to the first handler, add the other controls to the second
 handler and finally add the first handler to the second. For example:
 
-.. code-block:: none
+.. code-block:: c
 
 	v4l2_ctrl_new_std(&radio_ctrl_handler, &radio_ops, V4L2_CID_AUDIO_VOLUME, ...);
 	v4l2_ctrl_new_std(&radio_ctrl_handler, &radio_ops, V4L2_CID_AUDIO_MUTE, ...);
@@ -689,7 +689,7 @@ all controls.
 
 Or you can add specific controls to a handler:
 
-.. code-block:: none
+.. code-block:: c
 
 	volume = v4l2_ctrl_new_std(&video_ctrl_handler, &ops, V4L2_CID_AUDIO_VOLUME, ...);
 	v4l2_ctrl_new_std(&video_ctrl_handler, &ops, V4L2_CID_BRIGHTNESS, ...);
@@ -698,7 +698,7 @@ Or you can add specific controls to a handler:
 What you should not do is make two identical controls for two handlers.
 For example:
 
-.. code-block:: none
+.. code-block:: c
 
 	v4l2_ctrl_new_std(&radio_ctrl_handler, &radio_ops, V4L2_CID_AUDIO_MUTE, ...);
 	v4l2_ctrl_new_std(&video_ctrl_handler, &video_ops, V4L2_CID_AUDIO_MUTE, ...);
@@ -719,7 +719,7 @@ not own. For example, if you have to find a volume control from a subdev.
 
 You can do that by calling v4l2_ctrl_find:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct v4l2_ctrl *volume;
 
@@ -728,7 +728,7 @@ You can do that by calling v4l2_ctrl_find:
 Since v4l2_ctrl_find will lock the handler you have to be careful where you
 use it. For example, this is not a good idea:
 
-.. code-block:: none
+.. code-block:: c
 
 	struct v4l2_ctrl_handler ctrl_handler;
 
@@ -737,7 +737,7 @@ use it. For example, this is not a good idea:
 
 ...and in video_ops.s_ctrl:
 
-.. code-block:: none
+.. code-block:: c
 
 	case V4L2_CID_BRIGHTNESS:
 		contrast = v4l2_find_ctrl(&ctrl_handler, V4L2_CID_CONTRAST);
@@ -759,7 +759,7 @@ not when it is used in consumer-level hardware. In that case you want to keep
 those low-level controls local to the subdev. You can do this by simply
 setting the 'is_private' flag of the control to 1:
 
-.. code-block:: none
+.. code-block:: c
 
 	static const struct v4l2_ctrl_config ctrl_private = {
 		.ops = &ctrl_custom_ops,
@@ -796,7 +796,7 @@ Sometimes the platform or bridge driver needs to be notified when a control
 from a sub-device driver changes. You can set a notify callback by calling
 this function:
 
-.. code-block:: none
+.. code-block:: c
 
 	void v4l2_ctrl_notify(struct v4l2_ctrl *ctrl,
 		void (*notify)(struct v4l2_ctrl *ctrl, void *priv), void *priv);
-- 
2.21.0

