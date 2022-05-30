Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0342D53736D
	for <lists+linux-media@lfdr.de>; Mon, 30 May 2022 03:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbiE3B7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 May 2022 21:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbiE3B7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 May 2022 21:59:10 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30A726AD3
        for <linux-media@vger.kernel.org>; Sun, 29 May 2022 18:59:07 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id i18so9323477pfk.7
        for <linux-media@vger.kernel.org>; Sun, 29 May 2022 18:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zfUGFDCDre1lSHdwkgzBqrOA+/TxJztnzmf0BNR75BY=;
        b=ZTMsIBZtuYitMtFcPKCNiHz6Bh3s200I/VLzcT9B8+Z4d6tXpKKyMv5/1+rSTsZVBT
         XcvNcwMUNJj/3Tl10s0aKPxCZiGUE4cXhT8vwXixzcMxzbt9OiuQODMS9jXdPY4beX4z
         EXQBqfO1CB4p2HyktxVFH20+KL4/inWQ/EhmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zfUGFDCDre1lSHdwkgzBqrOA+/TxJztnzmf0BNR75BY=;
        b=DDof4/LEt3oIj49eP4QavjPc1hK9VewQdSPSYSakFnAzF0OMtUqAUOW7ckOIPfutuI
         y34PQ7MBWPDRv7pmEbEVcMdMKJJjW823upDn+iysU5nlXMSsvsD/bhjr0tkVQULi/E44
         eY1zupcOK8YWv1U52zdtKDO2QOX1NenL5s8U6DlbvODCK+yi4zyR0Ec/G19fT3fop6VJ
         4iuYt80apPjwy+db3HfK0n6beTgXNzrQvUZHB3TSIttXQWQDn0ZfmCRn/etf/3Fc47nc
         1OAwrYw/WGy/UgOVcyrUC/+OCzEE9LaB9wlMPo6d9p3QyEOc2JOjX53554TX6yYKzr9j
         puVg==
X-Gm-Message-State: AOAM533+wB9B+w/S9JagsmbPiEiB+sz6JyTHbJ4cg6DntRnHkjFh5HDW
        7B8nS1pBPCjakDXDXmfH2VaeyQ==
X-Google-Smtp-Source: ABdhPJwmN/725ZGdvMONxSUW2g/I7Ii/nKKDBfHsllBWxoQE1cHF0RBhjmGRqxMrP3BY/Y1t8Bhmnw==
X-Received: by 2002:a62:d45e:0:b0:51b:4d60:cda4 with SMTP id u30-20020a62d45e000000b0051b4d60cda4mr3329814pfl.17.1653875947128;
        Sun, 29 May 2022 18:59:07 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:12df:c9ac:bbf6:d8a5])
        by smtp.gmail.com with ESMTPSA id q6-20020a17090311c600b00163e31eb3a4sm676419plh.139.2022.05.29.18.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 18:59:06 -0700 (PDT)
Date:   Mon, 30 May 2022 10:59:01 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 3/5] media: uvcvideo: implement UVC v1.5 ROI
Message-ID: <YpQk5RQDgjbiLhDE@google.com>
References: <20220526050744.2431518-1-yunkec@google.com>
 <20220526050744.2431518-4-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526050744.2431518-4-yunkec@google.com>
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/05/26 14:07), Yunke Cao wrote:
> 
> Implement support for ROI as described in UVC 1.5:
> 4.2.2.1.20 Digital Region of Interest (ROI) Control
> 
> ROI control is implemented using V4L2 control API as
> two uvc-specific controls:
> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Just for information, several nitpicks from checkpatch


CHECK: Alignment should match open parenthesis
#75: FILE: drivers/media/usb/uvc/uvc_ctrl.c:781:
+static void uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
+	const struct uvc_rect *uvc_rect)

CHECK: Alignment should match open parenthesis
#84: FILE: drivers/media/usb/uvc/uvc_ctrl.c:790:
+static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
+	const struct v4l2_rect *v4l2_rect)

CHECK: Alignment should match open parenthesis
#146: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1075:
+		xctrl->value = __uvc_ctrl_get_value(mapping,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));

CHECK: Alignment should match open parenthesis
#204: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1604:
+		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping,
+				xctrl.value, changes);

CHECK: Alignment should match open parenthesis
#277: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1894:
+		ret = copy_from_user(&v4l2_rect, xctrl->p_rect,
+				sizeof(v4l2_rect));

CHECK: spaces preferred around that '+' (ctx:VxV)
#455: FILE: include/uapi/linux/uvcvideo.h:41:
+#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_UVC_BASE+1)
                                             	                         ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#456: FILE: include/uapi/linux/uvcvideo.h:42:
+#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_UVC_BASE+2)
                                             	                         ^

