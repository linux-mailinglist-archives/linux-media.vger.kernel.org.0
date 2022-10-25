Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB2460C953
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 12:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbiJYKEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 06:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbiJYKDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 06:03:34 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F61F50BA1
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 02:58:10 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so4029073pjk.2
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9idk8w9NvQsfvEQqIf9k8BP9C/+S7AEwKEb1pZioR3A=;
        b=MXpi7T6gG2Nr9LSHjIJDVWZ4QUyAYETBfmVgHM2Xt0NMEXznhL5C+Or9nxvptO7x6U
         9IJtSAEJNVvelsgsBC125SAe+6M1jOvSLwlUSAWlfSsmWNglwhBlcPho8oRc7lCHqBQ8
         0RDOl4vfE6o49xKD2be/UkT4uQfrxKySKOgjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9idk8w9NvQsfvEQqIf9k8BP9C/+S7AEwKEb1pZioR3A=;
        b=5FeHcr7D7AF0Xm4Jf62iDeAktUI0X1OhQbb/R+sQgGXYwFW+YCuiX9ECpy6nrP/zVy
         H1f0R9zVrSoHTF+PmnCI/KYxu+bgJ40Vf5lrTp6VE1EzfOdwkGFjLAr8eqKSAfHr4qQ5
         0keNjgoJRxQBXRUMEZC4dS0xO3UNvXrQ5HFjCcon47gJLfnUHGQcSLPBNE1mHQTgr2+V
         d1YAfwmZIvgBHXGUNcFC8Yh6vukO3NifFvBNEYtTcwmlhmGPivX0kqD+uDtXHTZBTHX5
         qTCebFaTAPnnN86AcDhcZkx7MWOQyzeiDvrJyfiVp2RYi6SzEWsAnfRDI/NwBY4wCvZ6
         g4Sg==
X-Gm-Message-State: ACrzQf006l2uNcQsWW7MCl6z5p+sfri7jo2bwhwWSf4iPQiX1I4b5lT6
        M8QZ7f+UOdpeLwLQM8NipWWfbg==
X-Google-Smtp-Source: AMsMyM7EtA/kfo/ay+aXdd7EQa5Dk1vnMayAptxc8BD5qhTrYPipI+wwI1JInerINLyK+JCANBRUlw==
X-Received: by 2002:a17:902:b944:b0:179:fdb0:1c39 with SMTP id h4-20020a170902b94400b00179fdb01c39mr37983169pls.98.1666691889846;
        Tue, 25 Oct 2022 02:58:09 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:c493:65a6:2d64:1325])
        by smtp.gmail.com with ESMTPSA id x21-20020aa79415000000b00565b259a52asm1097914pfo.1.2022.10.25.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 02:58:09 -0700 (PDT)
Date:   Tue, 25 Oct 2022 18:58:05 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v9 02/11] media: uvcvideo: add uvc_ctrl_get_boundary for
 getting default value
Message-ID: <Y1ezLUMVELC/J5ze@google.com>
References: <20221025055528.1117251-1-yunkec@google.com>
 <20221025055528.1117251-3-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025055528.1117251-3-yunkec@google.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/10/25 14:55), Yunke Cao wrote:
>  
> +int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
> +				struct uvc_control *ctrl,
> +				struct uvc_control_mapping *mapping,
> +				struct v4l2_ext_control *xctrl)

This should be static, as far as I can tell.
