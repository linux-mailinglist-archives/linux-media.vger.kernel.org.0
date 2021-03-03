Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5A332C712
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239937AbhCDAa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444526AbhCCNqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 08:46:37 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2853BC061A2B
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 05:43:57 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m1so6399346wml.2
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sFatDrTTk8QqhpQrxXr3ebT1Fq28H33Kmdp2vbOtLEY=;
        b=JN+pNUBNmoRVzmyxYCjZbYRzO+sgBe9ntzqJZE5KsicmUm686iLD/gtmxYujDKuJFG
         EdpRwSuIDzKvMWWzXFpuVyMc0Z/8oUsNVwiD+Y/98rL1O3nZEEKacuG5oLnsEkg7UI32
         i/CCJxLvq75MhT+jqReyFzFhOcB3Ylyl7+og6zurPtuI4vzr+pKkdbhT4YWhZroN0g9W
         QEpW44HNpHbO0XdwwhQPRYfcZ0zLnpSBGGVbFjs6xMKu1KcDzu6p2/SaXzYgDREiY++R
         DCboisRRX6fh4D+fEPxrtkhtVJvaSJO2vW3gA4YJgiU93YagoCJzCGGfPssKAzZTYNmx
         vCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sFatDrTTk8QqhpQrxXr3ebT1Fq28H33Kmdp2vbOtLEY=;
        b=TrD9P6hRifzz20nJirLanVIO6i/0fr4LPAw6OKG5ztqpY1f3K0bCOcFRvmvFpEiS8+
         kmzomr1TB3IjinJ0/f0bZ540pir6hIiXf0u/LW7JKtjbLlSJVt6WYiHVl0L+ywxWy5bl
         KKdHLfbTMVwkbyHc923O1UvlC+LqeKUZjJhnQYHmbD7TE3bp0lLOsj7QH0AG7eSSueTp
         UnfBEZZ7gUVxoHs8Z44UOeW7smRuZ/0bGkJpnSnf7DlhFiQ86nsHVm9IHQgoHPmvtq65
         8dLbu5hJ2pbpK8b5wj2VgVRGoO5Zfqg3b4OF32MNrqRp3tMFQKVziFs65n59lsHw+Zjx
         303A==
X-Gm-Message-State: AOAM531qKTd3g/tQkS9RoN5UsEzL+CnXSzcAJWwMr5WueEL44BLeI7GV
        sd3BVSnBUxskbnWD929vm+OcDw==
X-Google-Smtp-Source: ABdhPJylT1iR2h2Lg9leQR27Gb9vT9nE553qKmYJDPgCQk3GqVw1z9r9EffVmzICn+nguOeafP4RiQ==
X-Received: by 2002:a1c:2288:: with SMTP id i130mr9151603wmi.62.1614779035907;
        Wed, 03 Mar 2021 05:43:55 -0800 (PST)
Received: from dell.default ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:43:55 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, Zack Rusin <zackr@vmware.com>
Subject: [PATCH 23/53] drm/vmwgfx/vmwgfx_execbuf: Fix some kernel-doc related issues
Date:   Wed,  3 Mar 2021 13:42:49 +0000
Message-Id: <20210303134319.3160762-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:89: warning: Enum value 'vmw_res_rel_max' not described in enum 'vmw_resource_relocation_type'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:136: warning: Function parameter or member 'func' not described in 'vmw_cmd_entry'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:136: warning: Function parameter or member 'cmd_name' not described in 'vmw_cmd_entry'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:212: warning: Function parameter or member 'res' not described in 'vmw_cmd_ctx_first_setup'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:523: warning: Function parameter or member 'sw_context' not described in 'vmw_resource_relocation_add'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:523: warning: Excess function parameter 'list' description in 'vmw_resource_relocation_add'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:653: warning: Function parameter or member 'p_res' not described in 'vmw_cmd_res_check'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:653: warning: Excess function parameter 'p_val' description in 'vmw_cmd_res_check'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1716: warning: Function parameter or member 'res' not described in 'vmw_cmd_res_switch_backup'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:1716: warning: Excess function parameter 'val_node' description in 'vmw_cmd_res_switch_backup'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3757: warning: Function parameter or member 'file_priv' not described in 'vmw_execbuf_fence_commands'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3757: warning: Function parameter or member 'dev_priv' not described in 'vmw_execbuf_fence_commands'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3757: warning: Function parameter or member 'p_fence' not described in 'vmw_execbuf_fence_commands'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3757: warning: Function parameter or member 'p_handle' not described in 'vmw_execbuf_fence_commands'
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3954: warning: Function parameter or member 'kernel_commands' not described in 'vmw_execbuf_cmdbuf'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-4-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 462f173207085..7a24196f92c38 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -80,7 +80,8 @@ struct vmw_relocation {
  * with a NOP.
  * @vmw_res_rel_cond_nop: Conditional NOP relocation. If the resource id after
  * validation is -1, the command is replaced with a NOP. Otherwise no action.
- */
+ * @vmw_res_rel_max: Last value in the enum - used for error checking
+*/
 enum vmw_resource_relocation_type {
 	vmw_res_rel_normal,
 	vmw_res_rel_nop,
@@ -122,9 +123,11 @@ struct vmw_ctx_validation_info {
 /**
  * struct vmw_cmd_entry - Describe a command for the verifier
  *
+ * @func: Call-back to handle the command.
  * @user_allow: Whether allowed from the execbuf ioctl.
  * @gb_disable: Whether disabled if guest-backed objects are available.
  * @gb_enable: Whether enabled iff guest-backed objects are available.
+ * @cmd_name: Name of the command.
  */
 struct vmw_cmd_entry {
 	int (*func) (struct vmw_private *, struct vmw_sw_context *,
@@ -203,6 +206,7 @@ static void vmw_bind_dx_query_mob(struct vmw_sw_context *sw_context)
  *
  * @dev_priv: Pointer to the device private:
  * @sw_context: The command submission context
+ * @res: Pointer to the resource
  * @node: The validation node holding the context resource metadata
  */
 static int vmw_cmd_ctx_first_setup(struct vmw_private *dev_priv,
@@ -509,7 +513,7 @@ static int vmw_resource_context_res_add(struct vmw_private *dev_priv,
 /**
  * vmw_resource_relocation_add - Add a relocation to the relocation list
  *
- * @list: Pointer to head of relocation list.
+ * @sw_context: Pointer to the software context.
  * @res: The resource.
  * @offset: Offset into the command buffer currently being parsed where the id
  * that needs fixup is located. Granularity is one byte.
@@ -639,7 +643,7 @@ static int vmw_resources_reserve(struct vmw_sw_context *sw_context)
  * @converter: User-space visisble type specific information.
  * @id_loc: Pointer to the location in the command buffer currently being parsed
  * from where the user-space resource id handle is located.
- * @p_val: Pointer to pointer to resource validalidation node. Populated on
+ * @p_res: Pointer to pointer to resource validalidation node. Populated on
  * exit.
  */
 static int
@@ -1700,7 +1704,7 @@ static int vmw_cmd_check_define_gmrfb(struct vmw_private *dev_priv,
  *
  * @dev_priv: Pointer to a device private struct.
  * @sw_context: The software context being used for this batch.
- * @val_node: The validation node representing the resource.
+ * @res: Pointer to the resource.
  * @buf_id: Pointer to the user-space backup buffer handle in the command
  * stream.
  * @backup_offset: Offset of backup into MOB.
@@ -3739,7 +3743,7 @@ static int vmw_resize_cmd_bounce(struct vmw_sw_context *sw_context,
 	return 0;
 }
 
-/**
+/*
  * vmw_execbuf_fence_commands - create and submit a command stream fence
  *
  * Creates a fence object and submits a command stream marker.
@@ -3939,9 +3943,9 @@ static int vmw_execbuf_submit_cmdbuf(struct vmw_private *dev_priv,
  * On successful return, the function returns a pointer to the data in the
  * command buffer and *@header is set to non-NULL.
  *
- * If command buffers could not be used, the function will return the value of
- * @kernel_commands on function call. That value may be NULL. In that case, the
- * value of *@header will be set to NULL.
+ * @kernel_commands: If command buffers could not be used, the function will
+ * return the value of @kernel_commands on function call. That value may be
+ * NULL. In that case, the value of *@header will be set to NULL.
  *
  * If an error is encountered, the function will return a pointer error value.
  * If the function is interrupted by a signal while sleeping, it will return
-- 
2.27.0

