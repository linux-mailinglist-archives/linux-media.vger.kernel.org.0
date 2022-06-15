Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8989654D30D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347692AbiFOUvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347635AbiFOUvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:51:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 53E4154FB9
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kf5MpJ9eIk8XHXNDFFaU+bQFefhdFUBnDOOW9h41PV0=;
        b=iKx2NBgWSttzwHBAIU5+htFptgMiY7MyvxkGVFcQXN4JrIpda49HSsw3z3pJCOQ4yE2ZON
        dAuJHPEeK7lg0g7O4AIhvrmA9oQJAC9WBkPIyINVJGCoBCVmwhIgclBRt2mo+uVvz4ecLx
        9lT2zfJoFvNdiOjfa4QyEiOL91jM2kQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-4xinIT1vOQCGuBXnJc3CLQ-1; Wed, 15 Jun 2022 16:51:13 -0400
X-MC-Unique: 4xinIT1vOQCGuBXnJc3CLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 393CC2999B36;
        Wed, 15 Jun 2022 20:51:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7E381111F5;
        Wed, 15 Jun 2022 20:51:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 18/40] media: atomisp: remove private acceleration ioctls
Date:   Wed, 15 Jun 2022 22:50:15 +0200
Message-Id: <20220615205037.16549-19-hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
References: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These ioctls allow userspace to load custom programs into the ISP, which:

a) Seems dangerous
b) Cannot be used by opensource userspace since there is no FOSS code to
   create such programs
b) These seem to be unused even by the Android closed source camera code
   (they don't show up in a strace of the camera app)

So removing these seems be a good idea. Another reason to remove these is
that atomisp_acc_map() is the only user of the userptr functionality in
hmm_alloc(), so it gets in the way of further cleanups / simplification
of the hmm code.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     | 129 ------
 .../staging/media/atomisp/pci/atomisp_acc.c   | 394 ------------------
 .../staging/media/atomisp/pci/atomisp_acc.h   |  58 ---
 .../atomisp/pci/atomisp_compat_ioctl32.h      |  58 ---
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  38 --
 5 files changed, 677 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index a6ec9691afb2..bf8af139647d 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -740,24 +740,6 @@ enum atomisp_frame_status {
 	ATOMISP_FRAME_STATUS_FLASH_FAILED,
 };
 
-enum atomisp_acc_type {
-	ATOMISP_ACC_STANDALONE,	/* Stand-alone acceleration */
-	ATOMISP_ACC_OUTPUT,	/* Accelerator stage on output frame */
-	ATOMISP_ACC_VIEWFINDER	/* Accelerator stage on viewfinder frame */
-};
-
-enum atomisp_acc_arg_type {
-	ATOMISP_ACC_ARG_SCALAR_IN,    /* Scalar input argument */
-	ATOMISP_ACC_ARG_SCALAR_OUT,   /* Scalar output argument */
-	ATOMISP_ACC_ARG_SCALAR_IO,    /* Scalar in/output argument */
-	ATOMISP_ACC_ARG_PTR_IN,	     /* Pointer input argument */
-	ATOMISP_ACC_ARG_PTR_OUT,	     /* Pointer output argument */
-	ATOMISP_ACC_ARG_PTR_IO,	     /* Pointer in/output argument */
-	ATOMISP_ARG_PTR_NOFLUSH,  /* Pointer argument will not be flushed */
-	ATOMISP_ARG_PTR_STABLE,   /* Pointer input argument that is stable */
-	ATOMISP_ACC_ARG_FRAME	     /* Frame argument */
-};
-
 /* ISP memories, isp2400 */
 enum atomisp_acc_memory {
 	ATOMISP_ACC_MEMORY_PMEM0 = 0,
@@ -836,56 +818,6 @@ enum atomisp_burst_capture_options {
 #define EXT_ISP_SHOT_MODE_ANIMATED_PHOTO	10
 #define EXT_ISP_SHOT_MODE_SPORTS	11
 
-struct atomisp_sp_arg {
-	enum atomisp_acc_arg_type type;	/* Type  of SP argument */
-	void                    *value;	/* Value of SP argument */
-	unsigned int             size;	/* Size  of SP argument */
-};
-
-/* Acceleration API */
-
-/* For CSS 1.0 only */
-struct atomisp_acc_fw_arg {
-	unsigned int fw_handle;
-	unsigned int index;
-	void __user *value;
-	size_t size;
-};
-
-/*
- * Set arguments after first mapping with ATOMISP_IOC_ACC_S_MAPPED_ARG.
- */
-struct atomisp_acc_s_mapped_arg {
-	unsigned int fw_handle;
-	__u32 memory;			/* one of enum atomisp_acc_memory */
-	size_t length;
-	unsigned long css_ptr;
-};
-
-struct atomisp_acc_fw_abort {
-	unsigned int fw_handle;
-	/* Timeout in us */
-	unsigned int timeout;
-};
-
-struct atomisp_acc_fw_load {
-	unsigned int size;
-	unsigned int fw_handle;
-	void __user *data;
-};
-
-/*
- * Load firmware to specified pipeline.
- */
-struct atomisp_acc_fw_load_to_pipe {
-	__u32 flags;			/* Flags, see below for valid values */
-	unsigned int fw_handle;		/* Handle, filled by kernel. */
-	__u32 size;			/* Firmware binary size */
-	void __user *data;		/* Pointer to firmware */
-	__u32 type;			/* Binary type */
-	__u32 reserved[3];		/* Set to zero */
-};
-
 /*
  * Set Senor run mode
  */
@@ -905,24 +837,10 @@ struct atomisp_s_runmode {
 #define ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER	2 /* Stage on viewfinder */
 #define ATOMISP_ACC_FW_LOAD_TYPE_STANDALONE	3 /* Stand-alone acceleration */
 
-struct atomisp_acc_map {
-	__u32 flags;			/* Flags, see list below */
-	__u32 length;			/* Length of data in bytes */
-	void __user *user_ptr;		/* Pointer into user space */
-	unsigned long css_ptr;		/* Pointer into CSS address space */
-	__u32 reserved[4];		/* Set to zero */
-};
-
 #define ATOMISP_MAP_FLAG_NOFLUSH	0x0001	/* Do not flush cache */
 #define ATOMISP_MAP_FLAG_CACHED		0x0002	/* Enable cache */
 #define ATOMISP_MAP_FLAG_CLEARED	0x0004
 
-struct atomisp_acc_state {
-	__u32 flags;			/* Flags, see list below */
-#define ATOMISP_STATE_FLAG_ENABLE	ATOMISP_ACC_FW_LOAD_FL_ENABLE
-	unsigned int fw_handle;
-};
-
 struct atomisp_update_exposure {
 	unsigned int gain;
 	unsigned int digi_gain;
@@ -1090,29 +1008,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define ATOMISP_IOC_S_3A_CONFIG \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 23, struct atomisp_3a_config)
 
-/* Accelerate ioctls */
-#define ATOMISP_IOC_ACC_LOAD \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 24, struct atomisp_acc_fw_load)
-
-#define ATOMISP_IOC_ACC_UNLOAD \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 24, unsigned int)
-
-/* For CSS 1.0 only */
-#define ATOMISP_IOC_ACC_S_ARG \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 24, struct atomisp_acc_fw_arg)
-
-#define ATOMISP_IOC_ACC_START \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 24, unsigned int)
-
-#define ATOMISP_IOC_ACC_WAIT \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 25, unsigned int)
-
-#define ATOMISP_IOC_ACC_ABORT \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 25, struct atomisp_acc_fw_abort)
-
-#define ATOMISP_IOC_ACC_DESTAB \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 25, struct atomisp_acc_fw_arg)
-
 /* sensor OTP memory read */
 #define ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 26, struct v4l2_private_int_data)
@@ -1132,24 +1027,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 29, struct v4l2_private_int_data)
 
-/*
- * Ioctls to map and unmap user buffers to CSS address space for acceleration.
- * User fills fields length and user_ptr and sets other fields to zero,
- * kernel may modify the flags and sets css_ptr.
- */
-#define ATOMISP_IOC_ACC_MAP \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 30, struct atomisp_acc_map)
-
-/* User fills fields length, user_ptr, and css_ptr and zeroes other fields. */
-#define ATOMISP_IOC_ACC_UNMAP \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 30, struct atomisp_acc_map)
-
-#define ATOMISP_IOC_ACC_S_MAPPED_ARG \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 30, struct atomisp_acc_s_mapped_arg)
-
-#define ATOMISP_IOC_ACC_LOAD_TO_PIPE \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 31, struct atomisp_acc_fw_load_to_pipe)
-
 #define ATOMISP_IOC_S_PARAMETERS \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters)
 
@@ -1183,12 +1060,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define ATOMISP_IOC_S_EXPOSURE_WINDOW \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 40, struct atomisp_ae_window)
 
-#define ATOMISP_IOC_S_ACC_STATE \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 41, struct atomisp_acc_state)
-
-#define ATOMISP_IOC_G_ACC_STATE \
-	_IOR('v', BASE_VIDIOC_PRIVATE + 41, struct atomisp_acc_state)
-
 #define ATOMISP_IOC_INJECT_A_FAKE_EVENT \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 42, int)
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
index 28cb271663c4..07693983dd52 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.c
@@ -44,58 +44,12 @@ static const struct {
 	{ ATOMISP_ACC_FW_LOAD_FL_ACC, IA_CSS_PIPE_ID_ACC }
 };
 
-/*
- * Allocate struct atomisp_acc_fw along with space for firmware.
- * The returned struct atomisp_acc_fw is cleared (firmware region is not).
- */
-static struct atomisp_acc_fw *acc_alloc_fw(unsigned int fw_size)
-{
-	struct atomisp_acc_fw *acc_fw;
-
-	acc_fw = kzalloc(sizeof(*acc_fw), GFP_KERNEL);
-	if (!acc_fw)
-		return NULL;
-
-	acc_fw->fw = vmalloc(fw_size);
-	if (!acc_fw->fw) {
-		kfree(acc_fw);
-		return NULL;
-	}
-
-	return acc_fw;
-}
-
 static void acc_free_fw(struct atomisp_acc_fw *acc_fw)
 {
 	vfree(acc_fw->fw);
 	kfree(acc_fw);
 }
 
-static struct atomisp_acc_fw *
-acc_get_fw(struct atomisp_sub_device *asd, unsigned int handle)
-{
-	struct atomisp_acc_fw *acc_fw;
-
-	list_for_each_entry(acc_fw, &asd->acc.fw, list)
-		if (acc_fw->handle == handle)
-			return acc_fw;
-
-	return NULL;
-}
-
-static struct atomisp_map *acc_get_map(struct atomisp_sub_device *asd,
-				       unsigned long css_ptr, size_t length)
-{
-	struct atomisp_map *atomisp_map;
-
-	list_for_each_entry(atomisp_map, &asd->acc.memory_maps, list) {
-		if (atomisp_map->ptr == css_ptr &&
-		    atomisp_map->length == length)
-			return atomisp_map;
-	}
-	return NULL;
-}
-
 static int acc_stop_acceleration(struct atomisp_sub_device *asd)
 {
 	int ret;
@@ -138,189 +92,6 @@ void atomisp_acc_release(struct atomisp_sub_device *asd)
 	}
 }
 
-int atomisp_acc_load_to_pipe(struct atomisp_sub_device *asd,
-			     struct atomisp_acc_fw_load_to_pipe *user_fw)
-{
-	static const unsigned int pipeline_flags =
-	    ATOMISP_ACC_FW_LOAD_FL_PREVIEW | ATOMISP_ACC_FW_LOAD_FL_COPY |
-	    ATOMISP_ACC_FW_LOAD_FL_VIDEO |
-	    ATOMISP_ACC_FW_LOAD_FL_CAPTURE | ATOMISP_ACC_FW_LOAD_FL_ACC;
-
-	struct atomisp_acc_fw *acc_fw;
-	int handle;
-
-	if (!user_fw->data || user_fw->size < sizeof(*acc_fw->fw))
-		return -EINVAL;
-
-	/* Binary has to be enabled at least for one pipeline */
-	if (!(user_fw->flags & pipeline_flags))
-		return -EINVAL;
-
-	/* We do not support other flags yet */
-	if (user_fw->flags & ~pipeline_flags)
-		return -EINVAL;
-
-	if (user_fw->type < ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT ||
-	    user_fw->type > ATOMISP_ACC_FW_LOAD_TYPE_STANDALONE)
-		return -EINVAL;
-
-	if (asd->acc.pipeline || asd->acc.extension_mode)
-		return -EBUSY;
-
-	acc_fw = acc_alloc_fw(user_fw->size);
-	if (!acc_fw)
-		return -ENOMEM;
-
-	if (copy_from_user(acc_fw->fw, user_fw->data, user_fw->size)) {
-		acc_free_fw(acc_fw);
-		return -EFAULT;
-	}
-
-	handle = ida_alloc(&asd->acc.ida, GFP_KERNEL);
-	if (handle < 0) {
-		acc_free_fw(acc_fw);
-		return -ENOSPC;
-	}
-
-	user_fw->fw_handle = handle;
-	acc_fw->handle = handle;
-	acc_fw->flags = user_fw->flags;
-	acc_fw->type = user_fw->type;
-	acc_fw->fw->handle = handle;
-
-	/*
-	 * correct isp firmware type in order ISP firmware can be appended
-	 * to correct pipe properly
-	 */
-	if (acc_fw->fw->type == ia_css_isp_firmware) {
-		static const int type_to_css[] = {
-			[ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT] =
-			IA_CSS_ACC_OUTPUT,
-			[ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER] =
-			IA_CSS_ACC_VIEWFINDER,
-			[ATOMISP_ACC_FW_LOAD_TYPE_STANDALONE] =
-			IA_CSS_ACC_STANDALONE,
-		};
-		acc_fw->fw->info.isp.type = type_to_css[acc_fw->type];
-	}
-
-	list_add_tail(&acc_fw->list, &asd->acc.fw);
-	return 0;
-}
-
-int atomisp_acc_load(struct atomisp_sub_device *asd,
-		     struct atomisp_acc_fw_load *user_fw)
-{
-	struct atomisp_acc_fw_load_to_pipe ltp = {0};
-	int r;
-
-	ltp.flags = ATOMISP_ACC_FW_LOAD_FL_ACC;
-	ltp.type = ATOMISP_ACC_FW_LOAD_TYPE_STANDALONE;
-	ltp.size = user_fw->size;
-	ltp.data = user_fw->data;
-	r = atomisp_acc_load_to_pipe(asd, &ltp);
-	user_fw->fw_handle = ltp.fw_handle;
-	return r;
-}
-
-int atomisp_acc_unload(struct atomisp_sub_device *asd, unsigned int *handle)
-{
-	struct atomisp_acc_fw *acc_fw;
-
-	if (asd->acc.pipeline || asd->acc.extension_mode)
-		return -EBUSY;
-
-	acc_fw = acc_get_fw(asd, *handle);
-	if (!acc_fw)
-		return -EINVAL;
-
-	list_del(&acc_fw->list);
-	ida_free(&asd->acc.ida, acc_fw->handle);
-	acc_free_fw(acc_fw);
-
-	return 0;
-}
-
-int atomisp_acc_start(struct atomisp_sub_device *asd, unsigned int *handle)
-{
-	struct atomisp_device *isp = asd->isp;
-	struct atomisp_acc_fw *acc_fw;
-	int ret;
-	unsigned int nbin;
-
-	if (asd->acc.pipeline || asd->acc.extension_mode)
-		return -EBUSY;
-
-	/* Invalidate caches. FIXME: should flush only necessary buffers */
-	wbinvd();
-
-	ret = atomisp_css_create_acc_pipe(asd);
-	if (ret)
-		return ret;
-
-	nbin = 0;
-	list_for_each_entry(acc_fw, &asd->acc.fw, list) {
-		if (*handle != 0 && *handle != acc_fw->handle)
-			continue;
-
-		if (acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_STANDALONE)
-			continue;
-
-		/* Add the binary into the pipeline */
-		ret = atomisp_css_load_acc_binary(asd, acc_fw->fw, nbin);
-		if (ret < 0) {
-			dev_err(isp->dev, "acc_load_binary failed\n");
-			goto err_stage;
-		}
-
-		ret = atomisp_css_set_acc_parameters(acc_fw);
-		if (ret < 0) {
-			dev_err(isp->dev, "acc_set_parameters failed\n");
-			goto err_stage;
-		}
-		nbin++;
-	}
-	if (nbin < 1) {
-		/* Refuse creating pipelines with no binaries */
-		dev_err(isp->dev, "%s: no acc binary available\n", __func__);
-		ret = -EINVAL;
-		goto err_stage;
-	}
-
-	ret = atomisp_css_start_acc_pipe(asd);
-	if (ret) {
-		dev_err(isp->dev, "%s: atomisp_acc_start_acc_pipe failed\n",
-			__func__);
-		goto err_stage;
-	}
-
-	return 0;
-
-err_stage:
-	atomisp_css_destroy_acc_pipe(asd);
-	return ret;
-}
-
-int atomisp_acc_wait(struct atomisp_sub_device *asd, unsigned int *handle)
-{
-	struct atomisp_device *isp = asd->isp;
-	int ret;
-
-	if (!asd->acc.pipeline)
-		return -ENOENT;
-
-	if (*handle && !acc_get_fw(asd, *handle))
-		return -EINVAL;
-
-	ret = atomisp_css_wait_acc_finish(asd);
-	if (acc_stop_acceleration(asd) == -EIO) {
-		atomisp_reset(isp);
-		return -EINVAL;
-	}
-
-	return ret;
-}
-
 void atomisp_acc_done(struct atomisp_sub_device *asd, unsigned int handle)
 {
 	struct v4l2_event event = { 0 };
@@ -332,113 +103,6 @@ void atomisp_acc_done(struct atomisp_sub_device *asd, unsigned int handle)
 	v4l2_event_queue(asd->subdev.devnode, &event);
 }
 
-int atomisp_acc_map(struct atomisp_sub_device *asd, struct atomisp_acc_map *map)
-{
-	struct atomisp_map *atomisp_map;
-	ia_css_ptr cssptr;
-	int pgnr;
-
-	if (map->css_ptr)
-		return -EINVAL;
-
-	if (asd->acc.pipeline)
-		return -EBUSY;
-
-	if (map->user_ptr) {
-		/* Buffer to map must be page-aligned */
-		if ((unsigned long)map->user_ptr & ~PAGE_MASK) {
-			dev_err(asd->isp->dev,
-				"%s: mapped buffer address %p is not page aligned\n",
-				__func__, map->user_ptr);
-			return -EINVAL;
-		}
-
-		pgnr = DIV_ROUND_UP(map->length, PAGE_SIZE);
-		if (pgnr < ((PAGE_ALIGN(map->length)) >> PAGE_SHIFT)) {
-			dev_err(asd->isp->dev,
-				"user space memory size is less than the expected size..\n");
-			return -ENOMEM;
-		} else if (pgnr > ((PAGE_ALIGN(map->length)) >> PAGE_SHIFT)) {
-			dev_err(asd->isp->dev,
-				"user space memory size is large than the expected size..\n");
-			return -ENOMEM;
-		}
-
-		cssptr = hmm_alloc(map->length, HMM_BO_USER, 0, map->user_ptr,
-				   map->flags & ATOMISP_MAP_FLAG_CACHED);
-
-	} else {
-		/* Allocate private buffer. */
-		cssptr = hmm_alloc(map->length, HMM_BO_PRIVATE, 0, NULL,
-				   map->flags & ATOMISP_MAP_FLAG_CACHED);
-	}
-
-	if (!cssptr)
-		return -ENOMEM;
-
-	atomisp_map = kmalloc(sizeof(*atomisp_map), GFP_KERNEL);
-	if (!atomisp_map) {
-		hmm_free(cssptr);
-		return -ENOMEM;
-	}
-	atomisp_map->ptr = cssptr;
-	atomisp_map->length = map->length;
-	list_add(&atomisp_map->list, &asd->acc.memory_maps);
-
-	dev_dbg(asd->isp->dev, "%s: userptr %p, css_address 0x%x, size %d\n",
-		__func__, map->user_ptr, cssptr, map->length);
-	map->css_ptr = cssptr;
-	return 0;
-}
-
-int atomisp_acc_unmap(struct atomisp_sub_device *asd,
-		      struct atomisp_acc_map *map)
-{
-	struct atomisp_map *atomisp_map;
-
-	if (asd->acc.pipeline)
-		return -EBUSY;
-
-	atomisp_map = acc_get_map(asd, map->css_ptr, map->length);
-	if (!atomisp_map)
-		return -EINVAL;
-
-	list_del(&atomisp_map->list);
-	hmm_free(atomisp_map->ptr);
-	kfree(atomisp_map);
-	return 0;
-}
-
-int atomisp_acc_s_mapped_arg(struct atomisp_sub_device *asd,
-			     struct atomisp_acc_s_mapped_arg *arg)
-{
-	struct atomisp_acc_fw *acc_fw;
-
-	if (arg->memory >= ATOMISP_ACC_NR_MEMORY)
-		return -EINVAL;
-
-	if (asd->acc.pipeline)
-		return -EBUSY;
-
-	acc_fw = acc_get_fw(asd, arg->fw_handle);
-	if (!acc_fw)
-		return -EINVAL;
-
-	if (arg->css_ptr != 0 || arg->length != 0) {
-		/* Unless the parameter is cleared, check that it exists */
-		if (!acc_get_map(asd, arg->css_ptr, arg->length))
-			return -EINVAL;
-	}
-
-	acc_fw->args[arg->memory].length = arg->length;
-	acc_fw->args[arg->memory].css_ptr = arg->css_ptr;
-
-	dev_dbg(asd->isp->dev, "%s: mem %d, address %p, size %ld\n",
-		__func__, arg->memory, (void *)arg->css_ptr,
-		(unsigned long)arg->length);
-	return 0;
-}
-
 static void atomisp_acc_unload_some_extensions(struct atomisp_sub_device *asd,
 					      int i,
 					      struct atomisp_acc_fw *acc_fw)
@@ -565,61 +229,3 @@ void atomisp_acc_unload_extensions(struct atomisp_sub_device *asd)
 
 	asd->acc.extension_mode = false;
 }
-
-int atomisp_acc_set_state(struct atomisp_sub_device *asd,
-			  struct atomisp_acc_state *arg)
-{
-	struct atomisp_acc_fw *acc_fw;
-	bool enable = (arg->flags & ATOMISP_STATE_FLAG_ENABLE) != 0;
-	struct ia_css_pipe *pipe;
-	int r;
-	int i;
-
-	if (!asd->acc.extension_mode)
-		return -EBUSY;
-
-	if (arg->flags & ~ATOMISP_STATE_FLAG_ENABLE)
-		return -EINVAL;
-
-	acc_fw = acc_get_fw(asd, arg->fw_handle);
-	if (!acc_fw)
-		return -EINVAL;
-
-	if (enable)
-		wbinvd();
-
-	for (i = 0; i < ARRAY_SIZE(acc_flag_to_pipe); i++) {
-		if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
-			pipe = asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
-			       pipes[acc_flag_to_pipe[i].pipe_id];
-			r = ia_css_pipe_set_qos_ext_state(pipe, acc_fw->handle,
-							  enable);
-			if (r)
-				return -EBADRQC;
-		}
-	}
-
-	if (enable)
-		acc_fw->flags |= ATOMISP_ACC_FW_LOAD_FL_ENABLE;
-	else
-		acc_fw->flags &= ~ATOMISP_ACC_FW_LOAD_FL_ENABLE;
-
-	return 0;
-}
-
-int atomisp_acc_get_state(struct atomisp_sub_device *asd,
-			  struct atomisp_acc_state *arg)
-{
-	struct atomisp_acc_fw *acc_fw;
-
-	if (!asd->acc.extension_mode)
-		return -EBUSY;
-
-	acc_fw = acc_get_fw(asd, arg->fw_handle);
-	if (!acc_fw)
-		return -EINVAL;
-
-	arg->flags = acc_fw->flags;
-
-	return 0;
-}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.h b/drivers/staging/media/atomisp/pci/atomisp_acc.h
index 48d94232229b..e0d15dd96829 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.h
@@ -41,52 +41,6 @@ void atomisp_acc_cleanup(struct atomisp_device *isp);
  */
 void atomisp_acc_release(struct atomisp_sub_device *asd);
 
-/* Load acceleration binary. DEPRECATED. */
-int atomisp_acc_load(struct atomisp_sub_device *asd,
-		     struct atomisp_acc_fw_load *fw);
-
-/* Load acceleration binary with specified properties */
-int atomisp_acc_load_to_pipe(struct atomisp_sub_device *asd,
-			     struct atomisp_acc_fw_load_to_pipe *fw);
-
-/* Unload specified acceleration binary */
-int atomisp_acc_unload(struct atomisp_sub_device *asd,
-		       unsigned int *handle);
-
-/*
- * Map a memory region into ISP memory space.
- */
-int atomisp_acc_map(struct atomisp_sub_device *asd,
-		    struct atomisp_acc_map *map);
-
-/*
- * Unmap a mapped memory region.
- */
-int atomisp_acc_unmap(struct atomisp_sub_device *asd,
-		      struct atomisp_acc_map *map);
-
-/*
- * Set acceleration binary argument to a previously mapped memory region.
- */
-int atomisp_acc_s_mapped_arg(struct atomisp_sub_device *asd,
-			     struct atomisp_acc_s_mapped_arg *arg);
-
-/*
- * Start acceleration.
- * Return immediately, acceleration is left running in background.
- * Specify either acceleration binary or pipeline which to start.
- */
-int atomisp_acc_start(struct atomisp_sub_device *asd,
-		      unsigned int *handle);
-
-/*
- * Wait until acceleration finishes.
- * This MUST be called after each acceleration has been started.
- * Specify either acceleration binary or pipeline handle.
- */
-int atomisp_acc_wait(struct atomisp_sub_device *asd,
-		     unsigned int *handle);
-
 /*
  * Used by ISR to notify ACC stage finished.
  * This is internally used and does not export as IOCTL.
@@ -105,16 +59,4 @@ int atomisp_acc_load_extensions(struct atomisp_sub_device *asd);
  */
 void atomisp_acc_unload_extensions(struct atomisp_sub_device *asd);
 
-/*
- * Set acceleration firmware flags.
- */
-int atomisp_acc_set_state(struct atomisp_sub_device *asd,
-			  struct atomisp_acc_state *arg);
-
-/*
- * Get acceleration firmware flags.
- */
-int atomisp_acc_get_state(struct atomisp_sub_device *asd,
-			  struct atomisp_acc_state *arg);
-
 #endif /* __ATOMISP_ACC_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
index 86d3fbe01378..33821b51d90e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
@@ -140,19 +140,6 @@ struct atomisp_calibration_group32 {
 	compat_uptr_t calb_grp_values;
 };
 
-struct atomisp_acc_fw_load32 {
-	unsigned int size;
-	unsigned int fw_handle;
-	compat_uptr_t data;
-};
-
-struct atomisp_acc_fw_arg32 {
-	unsigned int fw_handle;
-	unsigned int index;
-	compat_uptr_t value;
-	compat_size_t size;
-};
-
 struct v4l2_private_int_data32 {
 	__u32 size;
 	compat_uptr_t data;
@@ -170,21 +157,6 @@ struct atomisp_shading_table32 {
 	compat_uptr_t data[ATOMISP_NUM_SC_COLORS];
 };
 
-struct atomisp_acc_map32 {
-	__u32 flags;			/* Flags, see list below */
-	__u32 length;			/* Length of data in bytes */
-	compat_uptr_t user_ptr;		/* Pointer into user space */
-	compat_ulong_t css_ptr;		/* Pointer into CSS address space */
-	__u32 reserved[4];		/* Set to zero */
-};
-
-struct atomisp_acc_s_mapped_arg32 {
-	unsigned int fw_handle;
-	__u32 memory;			/* one of enum atomisp_acc_memory */
-	compat_size_t length;
-	compat_ulong_t css_ptr;
-};
-
 struct atomisp_parameters32 {
 	compat_uptr_t wb_config;  /* White Balance config */
 	compat_uptr_t cc_config;  /* Color Correction config */
@@ -265,15 +237,6 @@ struct atomisp_parameters32 {
 	u32	per_frame_setting;
 };
 
-struct atomisp_acc_fw_load_to_pipe32 {
-	__u32 flags;			/* Flags, see below for valid values */
-	unsigned int fw_handle;		/* Handle, filled by kernel. */
-	__u32 size;			/* Firmware binary size */
-	compat_uptr_t data;		/* Pointer to firmware */
-	__u32 type;			/* Binary type */
-	__u32 reserved[3];		/* Set to zero */
-};
-
 struct atomisp_dvs_6axis_config32 {
 	u32 exp_id;
 	u32 width_y;
@@ -323,15 +286,6 @@ struct atomisp_sensor_ae_bracketing_lut32 {
 #define ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP32 \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 22, struct atomisp_calibration_group32)
 
-#define ATOMISP_IOC_ACC_LOAD32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 24, struct atomisp_acc_fw_load32)
-
-#define ATOMISP_IOC_ACC_S_ARG32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 24, struct atomisp_acc_fw_arg32)
-
-#define ATOMISP_IOC_ACC_DESTAB32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 25, struct atomisp_acc_fw_arg32)
-
 #define ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA32 \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 26, struct v4l2_private_int_data32)
 
@@ -341,18 +295,6 @@ struct atomisp_sensor_ae_bracketing_lut32 {
 #define ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA32 \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 29, struct v4l2_private_int_data32)
 
-#define ATOMISP_IOC_ACC_MAP32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 30, struct atomisp_acc_map32)
-
-#define ATOMISP_IOC_ACC_UNMAP32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 30, struct atomisp_acc_map32)
-
-#define ATOMISP_IOC_ACC_S_MAPPED_ARG32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 30, struct atomisp_acc_s_mapped_arg32)
-
-#define ATOMISP_IOC_ACC_LOAD_TO_PIPE32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 31, struct atomisp_acc_fw_load_to_pipe32)
-
 #define ATOMISP_IOC_S_PARAMETERS32 \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters32)
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index fef7b08965b3..ea38f05b3233 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -3118,38 +3118,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 			err = -EINVAL;
 		break;
 
-	case ATOMISP_IOC_ACC_LOAD:
-		err = atomisp_acc_load(asd, arg);
-		break;
-
-	case ATOMISP_IOC_ACC_LOAD_TO_PIPE:
-		err = atomisp_acc_load_to_pipe(asd, arg);
-		break;
-
-	case ATOMISP_IOC_ACC_UNLOAD:
-		err = atomisp_acc_unload(asd, arg);
-		break;
-
-	case ATOMISP_IOC_ACC_START:
-		err = atomisp_acc_start(asd, arg);
-		break;
-
-	case ATOMISP_IOC_ACC_WAIT:
-		err = atomisp_acc_wait(asd, arg);
-		break;
-
-	case ATOMISP_IOC_ACC_MAP:
-		err = atomisp_acc_map(asd, arg);
-		break;
-
-	case ATOMISP_IOC_ACC_UNMAP:
-		err = atomisp_acc_unmap(asd, arg);
-		break;
-
-	case ATOMISP_IOC_ACC_S_MAPPED_ARG:
-		err = atomisp_acc_s_mapped_arg(asd, arg);
-		break;
-
 	case ATOMISP_IOC_S_ISP_SHD_TAB:
 		err = atomisp_set_shading_table(asd, arg);
 		break;
@@ -3198,12 +3166,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 	case ATOMISP_IOC_S_EXPOSURE_WINDOW:
 		err = atomisp_s_ae_window(asd, arg);
 		break;
-	case ATOMISP_IOC_S_ACC_STATE:
-		err = atomisp_acc_set_state(asd, arg);
-		break;
-	case ATOMISP_IOC_G_ACC_STATE:
-		err = atomisp_acc_get_state(asd, arg);
-		break;
 	case ATOMISP_IOC_INJECT_A_FAKE_EVENT:
 		err = atomisp_inject_a_fake_event(asd, arg);
 		break;
-- 
2.36.0

