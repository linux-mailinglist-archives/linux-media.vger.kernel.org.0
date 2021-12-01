Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD13B464FA4
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 15:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243662AbhLAOcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 09:32:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349922AbhLAOcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 09:32:07 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B72DC06174A
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 06:28:46 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id v19so17833591plo.7
        for <linux-media@vger.kernel.org>; Wed, 01 Dec 2021 06:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rY2VF/AmOobD5q304Y/BhvqBvgYCL9pl956RNeRID/0=;
        b=A04yRCnYLLzXAZHjEOqaOHSfT/CGiw7Z8xHRKn1MI4H6cs0wlVuwUYCUbe2mkWox/R
         kSSD0BEU/a+pT8edLRfM//AX4h3srPN59jGmUxHGKMsq4dPTnrctuULcglxOG1cybCC4
         glulXma7KW/+Scytz6jbbx77veeGI7Ayd8vlg+Az5yy7mtK/SnxmrmPCkuY7pcHfjHxb
         4t7a+32HB8oiz8zbOascABE9o3WcdhiEH5nu1Dz7es9oFu9uVnG9nsKm1inOT3HL/ds3
         h4yPsytjS2pG9sAt+0DJkuCrliC5pW5mHigzrpyR75PGdzzzVyulDXk7KtKfyvWLrl0k
         oK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rY2VF/AmOobD5q304Y/BhvqBvgYCL9pl956RNeRID/0=;
        b=v8BBFUKYNbVfc7/xQyG2neli4b778+FP+D6NcsnM19cYf0XyC1/c7cKiY+rTQjmZSJ
         kBcWLb5uVk1R9b9rANIGOgSpjveNPTlZ3rTEUATfQYeIoh9w2Z+KEa+lDLz5pU5twKuR
         EZ3Fmx3qG57oo/ejCeJbsDxUxH5UmwO2yEj4mFTJyqeO6Z3HC+VZPc/MG2WAgxGSy8wS
         a3evAn0m2IudPB2u0JKFezx3zvw68vXggqRXXjuLiSwisWSTd3hMainCfxpMd6W9PDhA
         TbuOnu55HKpphbz9YelroXJaw4d4mgfgnus/2VpC0NEujQQ1Evtka6IUQxWM72h77OdL
         lIYg==
X-Gm-Message-State: AOAM533RxjZ7sIFGjYR9mrPkphdJ5R9wNb0MXTIYKvv6COztIGsJzOtr
        vtLUofXQyCAMT4zw6ja0iaA=
X-Google-Smtp-Source: ABdhPJxpmVPH95wgAW6GCpxS8sRbgKa7qGqiVL3U7fX80LMMe8Cmqms/cD/f9RyMjwemmlQ1W+QLKw==
X-Received: by 2002:a17:902:f551:b0:143:759c:6a30 with SMTP id h17-20020a170902f55100b00143759c6a30mr8148260plf.0.1638368925487;
        Wed, 01 Dec 2021 06:28:45 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id h3sm1564973pjz.43.2021.12.01.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 06:28:45 -0800 (PST)
Message-ID: <0d2058ff36dd15cd4475d42891f1f7058db9cb6e.camel@gmail.com>
Subject: Re: [bug report] media: atomisp: add NULL check for asd obtained
 from atomisp_video_pipe
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org
Date:   Wed, 01 Dec 2021 23:28:43 +0900
In-Reply-To: <20211122074122.GA6581@kili>
References: <20211122074122.GA6581@kili>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-11-22 at 10:41 +0300, Dan Carpenter wrote:
> Hello Tsuchiya Yuto,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch c10bcb13462e: "media: atomisp: add NULL check for asd 
> obtained from atomisp_video_pipe" from Oct 18, 2021, leads to the 
> following Smatch complaint:
> 
> drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1188 __atomisp_reqbufs()
> warn: variable dereferenced before check 'asd' (see line 1185)
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:5192 atomisp_set_fmt_to_isp()
> warn: variable dereferenced before check 'asd' (see line 5188)
> 
> drivers/staging/media/atomisp/pci/atomisp_ioctl.c
>   1175  int __atomisp_reqbufs(struct file *file, void *fh,
>   1176                        struct v4l2_requestbuffers *req)
>   1177  {
>   1178          struct video_device *vdev = video_devdata(file);
>   1179          struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>   1180          struct atomisp_sub_device *asd = pipe->asd;
>   1181          struct ia_css_frame_info frame_info;
>   1182          struct ia_css_frame *frame;
>   1183          struct videobuf_vmalloc_memory *vm_mem;
>   1184		u16 source_pad = atomisp_subdev_source_pad(vdev);
>   1185		u16 stream_id = atomisp_source_pad_to_stream_id(asd, source_pad);
>                                                                 ^^^
> There is an unchecked dereference inside this function.
> 
>   1186		int ret = 0, i = 0;
>   1187	
>   1188		if (!asd) {
>                     ^^^^
> This new check is too late.
> 
>   1189			dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
>   1190				__func__, vdev->name);
> 
> atomisp_set_fmt_to_isp() has the same thing.
> 
> regards,
> dan carpenter

Hello, thank you for pointing out this issue! For the record, patch sent
as:

	https://lore.kernel.org/linux-media/20211201141904.47231-1-kitakar@gmail.com/
	("media: atomisp: fix "variable dereferenced before check 'asd'"")

Regards,
Tsuchiya Yuto
