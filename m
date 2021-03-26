Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA2F34AD40
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 18:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhCZRVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 13:21:09 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55500 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhCZRUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 13:20:52 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210326172050euoutp014f3cdf07dc9bd41093c310cc07e70fb2~v9CmV10iI0878508785euoutp01v
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 17:20:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210326172050euoutp014f3cdf07dc9bd41093c310cc07e70fb2~v9CmV10iI0878508785euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1616779250;
        bh=5ycsHJieO61oyBDXB4dIHaMLQHU6SJHcz90jNt2n+vQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=KTbogjWF9BOKll5J78U0CG1Jt9Hze+wm96Jcfk9awuMQjKymqWLOkJBJWeCO5Emcu
         Vgn7GF3k7HjXYYIzMFNzn3eYdLRZxK0oEA3ZdfZqQOusBSigSPe1Tf1aY6edlZ/+75
         YN/805S9VW2yGYhAlHL+DHarepsh7h5NIc99KPNw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210326172049eucas1p25e1407c7c9701d4d380bba9c71f66a42~v9ClmcWqD1892618926eucas1p2o;
        Fri, 26 Mar 2021 17:20:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C7.C7.09439.1F71E506; Fri, 26
        Mar 2021 17:20:49 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210326172049eucas1p2209de36f9519a2adb488a3b9f18b7f89~v9ClLXM9q1893618936eucas1p2l;
        Fri, 26 Mar 2021 17:20:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210326172049eusmtrp240d4b45b7f58f77da61ae30092d53ccf~v9ClKsnHF2876228762eusmtrp2G;
        Fri, 26 Mar 2021 17:20:49 +0000 (GMT)
X-AuditID: cbfec7f5-c03ff700000024df-cf-605e17f127a1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 99.C9.08696.1F71E506; Fri, 26
        Mar 2021 17:20:49 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210326172049eusmtip249d286a2ddd1c14b07f0130b9c92cbed~v9Ck5i8mi0373103731eusmtip2S;
        Fri, 26 Mar 2021 17:20:49 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] media: s5p-mfc: Fix kernel-doc entries in s5p_mfc_common.h
Date:   Fri, 26 Mar 2021 18:20:40 +0100
Message-Id: <20210326172040.7674-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsWy7djP87ofxeMSDD6f1bM4NfkZk0XPhq2s
        FofftLM6MHv0bVnF6PF5k5zHqa+f2QOYo7hsUlJzMstSi/TtErgyZv44xFxwVL/iwa/TzA2M
        p9S7GDk4JARMJLqmCHYxcnEICaxglOi6fJQZwvnCKPFow30o5zOjxMxjmxm7GDnBOqbtbmIC
        sYUEljNKfL5aD9fRPuECC0iCTcBQovdoH1iDiIC8xJPeG2wgNrOAs8TjWX/AmoUFvCXmNS0C
        q2ERUJXY+ncaO4jNK2AlsfrFDlaIZfISqzccALtCQuAau8S87x/YIRIuEitPPIQqEpZ4dXwL
        VFxG4v/O+UwQDc2MEj27b7NDOBMYJe4fXwD1g7XEnXO/2EAhwCygKbF+lz5E2FHi1YLHrJCA
        4ZO48VYQ4mg+iUnbpjNDhHklOtqEIKpVJH6vms4EYUtJdD/5zwJhe0gs/j+DDRJAsRL/rh9n
        ncAoNwth1wJGxlWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiB8Xz63/GvOxhXvPqod4iR
        iYPxEKMEB7OSCC/r6dgEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4ry7tq6JFxJITyxJzU5NLUgt
        gskycXBKNTC1zmNJffxog8XnM3FBauGq4qfeBE2sDN246KtHzFHFvJ7aAzKyy/f3JgV/2eEm
        zxZ/6tsZA/3ml46LvKcYKXts338l/GGM4JbVB9jOXIqa0W+15nRyus/C5Hvxti6uWo8l1nEv
        XbmSzSv5vwKPYd6KaypNF19FTP+W0Gx+jiPyTot277ZHE7QbY1LP1oXenGeqdrAte63NNI2Q
        183ap3ZoBAWVSzoEltm/f3Gx3F0jYnVewaUtRf61xtt4NsWd+5PFwZX+O+nnj9Z8CSXN1Wxr
        ZFOXPzBdtHd5wz1+9viMJ99vCuw0YZ9+eu15q4WxNf3Hjjkem5dvnDiXp3C30xx3t1r+ymOL
        dRd6zomU41JiKc5INNRiLipOBAAOJVszVgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsVy+t/xe7ofxeMSDP5dE7U4NfkZk0XPhq2s
        FofftLM6MHv0bVnF6PF5k5zHqa+f2QOYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
        zWOtjEyV9O1sUlJzMstSi/TtEvQyZv44xFxwVL/iwa/TzA2Mp9S7GDk5JARMJKbtbmLqYuTi
        EBJYyigxq3snexcjB1BCSmJ+ixJEjbDEn2tdbBA1nxglJvxfwAKSYBMwlOg92scIYosIyEs8
        6b3BBmIzC7hKfDhxkwnEFhbwlpjXtAishkVAVWLr32nsIDavgJXE6hc7WCEWyEus3nCAeQIj
        zwJGhlWMIqmlxbnpucVGesWJucWleel6yfm5mxiBYbTt2M8tOxhXvvqod4iRiYPxEKMEB7OS
        CC/r6dgEId6UxMqq1KL8+KLSnNTiQ4ymQPsmMkuJJucDAzmvJN7QzMDU0MTM0sDU0sxYSZzX
        5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQam7hNnJDf6cOd4P7KtymwtUPFc2fpLKmdBCavePfk/
        so777MXnp4RO3Hnq6sN9dkUXO1Jvska3zN/VnKL/q6JJ9nfXHxGlpvnLy1f8X8ZRFMmj3tz3
        MDbV3/xB6roPXhfiJWNnuc89I2ij8bLLufBX61OJJdb8kZbXfkyc/tjD+uyhT48ZxHmvORSl
        Mfzck7fxauTVvhM/dtWe+LcwvpzLP03xqdDjgJZ1ibsMd1ac0Jrpe7e7Yk6we9bBi7uuiM7y
        eRW80Ml76847G/9+cZ9zUv7U0cUJ0/S29s2f6ttygf9f0NX3BVIVDzuDXDSWFz9NSKj5d+5C
        zHmv0PU6Z8QcH/ZLX18teHSW92MGtu0JSizFGYmGWsxFxYkAu4r8jKwCAAA=
X-CMS-MailID: 20210326172049eucas1p2209de36f9519a2adb488a3b9f18b7f89
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210326172049eucas1p2209de36f9519a2adb488a3b9f18b7f89
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210326172049eucas1p2209de36f9519a2adb488a3b9f18b7f89
References: <CGME20210326172049eucas1p2209de36f9519a2adb488a3b9f18b7f89@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes scripts/kernel-doc warnings:

s5p_mfc_common.h:343: warning: Function parameter or member 'fw_buf' not described in 's5p_mfc_dev'
s5p_mfc_common.h:343: warning: Function parameter or member 'mem_size' not described in 's5p_mfc_dev'
s5p_mfc_common.h:343: warning: Function parameter or member 'mem_base' not described in 's5p_mfc_dev'
s5p_mfc_common.h:343: warning: Function parameter or member 'mem_bitmap' not described in 's5p_mfc_dev'
s5p_mfc_common.h:343: warning: Function parameter or member 'mem_virt' not described in 's5p_mfc_dev'
s5p_mfc_common.h:343: warning: Function parameter or member 'dma_base' not described in 's5p_mfc_dev'
s5p_mfc_common.h:343: warning: Function parameter or member 'watchdog_timer' not described in 's5p_mfc_dev'
s5p_mfc_common.h:343: warning: Function parameter or member 'fw_get_done' not described in 's5p_mfc_dev'
s5p_mfc_common.h:343: warning: Function parameter or member 'risc_on' not described in 's5p_mfc_dev'
s5p_mfc_common.h:714: warning: Function parameter or member 'src_bufs_cnt' not described in 's5p_mfc_ctx'
s5p_mfc_common.h:714: warning: Function parameter or member 'dst_bufs_cnt' not described in 's5p_mfc_ctx'
s5p_mfc_common.h:714: warning: Function parameter or member 'pb_count' not described in 's5p_mfc_ctx'
s5p_mfc_common.h:714: warning: Function parameter or member 'force_frame_type' not described in 's5p_mfc_ctx'
s5p_mfc_common.h:714: warning: Function parameter or member 'slice_mode' not described in 's5p_mfc_ctx'
s5p_mfc_common.h:714: warning: Function parameter or member 'slice_size' not described in 's5p_mfc_ctx'
s5p_mfc_common.h:714: warning: Function parameter or member 'frame_tag' not described in 's5p_mfc_ctx'
s5p_mfc_common.h:714: warning: Function parameter or member 'scratch_buf_size' not described in 's5p_mfc_ctx'

Reported-by: Hans verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Depends on Hans' "s5p-mfc/s5p_mfc_common.h: fix kernel-doc warnings" patch.
---
 .../media/platform/s5p-mfc/s5p_mfc_common.h   | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
index 80851084bc83..c3ef4f6a42d2 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
@@ -273,14 +273,18 @@ struct s5p_mfc_priv_buf {
  * @int_type:		type of last interrupt
  * @int_err:		error number for last interrupt
  * @queue:		waitqueue for waiting for completion of device commands
- * @fw_size:		size of firmware
- * @fw_virt_addr:	virtual firmware address
- * @dma_base[]:		address of the beginning of memory banks
+ * @fw_buf:		the firmware buffer data structure
+ * @mem_size:		size of the firmware operation memory
+ * @mem_base:		base DMA address of the firmware operation memory
+ * @mem_bitmap:		bitmap for managing MFC internal buffer allocations
+ * @mem_virt:		virtual address of the firmware operation memory
+ * @dma_base:		address of the beginning of memory banks
  * @hw_lock:		used for hardware locking
  * @ctx:		array of driver contexts
  * @curr_ctx:		number of the currently running context
  * @ctx_work_bits:	used to mark which contexts are waiting for hardware
  * @watchdog_cnt:	counter for the watchdog
+ * @watchdog_timer:	timer for the watchdog
  * @watchdog_workqueue:	workqueue for the watchdog
  * @watchdog_work:	worker for the watchdog
  * @enter_suspend:	flag set when entering suspend
@@ -290,9 +294,9 @@ struct s5p_mfc_priv_buf {
  * @mfc_cmds:		cmd structure holding HW commands function pointers
  * @mfc_regs:		structure holding MFC registers
  * @fw_ver:		loaded firmware sub-version
- * @fw_get_done		flag set when request_firmware() is complete and
+ * @fw_get_done:	flag set when request_firmware() is complete and
  *			copied into fw_buf
- * risc_on:		flag indicates RISC is on or off
+ * @risc_on:		flag indicates RISC is on or off
  *
  */
 struct s5p_mfc_dev {
@@ -579,7 +583,9 @@ struct s5p_mfc_codec_ops {
  * @capture_state:	state of the capture buffers queue
  * @output_state:	state of the output buffers queue
  * @src_bufs:		information on allocated source buffers
+ * @src_bufs_cnt:	number of allocated source buffers
  * @dst_bufs:		information on allocated destination buffers
+ * @dst_bufs_cnt:	number of allocated destination buffers
  * @sequence:		counter for the sequence number for v4l2
  * @dec_dst_flag:	flags for buffers queued in the hardware
  * @dec_src_buf_size:	size of the buffer for source buffers in decoding
@@ -591,7 +597,7 @@ struct s5p_mfc_codec_ops {
  * @after_packed_pb:	flag used to track buffer when stream is in
  *			Packed PB format
  * @sei_fp_parse:	enable/disable parsing of frame packing SEI information
- * @dpb_count:		count of the DPB buffers required by MFC hw
+ * @pb_count:		count of the DPB buffers required by MFC hw
  * @total_dpb_count:	count of DPB buffers with additional buffers
  *			requested by the application
  * @ctx:		context buffer information
@@ -606,11 +612,15 @@ struct s5p_mfc_codec_ops {
  * @tmv_buffer_size:	size of temporal predictor motion vector buffer
  * @frame_type:		used to force the type of the next encoded frame
  * @ref_queue:		list of the reference buffers for encoding
+ * @force_frame_type:	encoder's frame type forcing control
  * @ref_queue_cnt:	number of the buffers in the reference list
+ * @slice_size:		slice size
+ * @slice_mode:		mode of dividing frames into slices
  * @c_ops:		ops for encoding
  * @ctrls:		array of controls, used when adding controls to the
  *			v4l2 control framework
  * @ctrl_handler:	handler for v4l2 framework
+ * @scratch_buf_size:	scratch buffer size
  */
 struct s5p_mfc_ctx {
 	struct s5p_mfc_dev *dev;
@@ -709,7 +719,6 @@ struct s5p_mfc_ctx {
 
 	struct v4l2_ctrl *ctrls[MFC_MAX_CTRLS];
 	struct v4l2_ctrl_handler ctrl_handler;
-	unsigned int frame_tag;
 	size_t scratch_buf_size;
 };
 
-- 
2.25.1

