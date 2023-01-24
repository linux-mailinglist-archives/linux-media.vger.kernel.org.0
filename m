Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01BFF679640
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbjAXLK3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbjAXLKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0EF940D4
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674558564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AYWcGPAz6QIYZJJbGq0zOHIyyGv/CshPeC5FZEnQikw=;
        b=E1Dky/haZxpiiH0lmpmej72jZARxtQ5RYy8gsoImQChxjCofZYYCAnUITm5aNGOtcQ3csR
        m/6S7uOrd5DUKPGxf88tnPLASLLt2l6yulk641HwBjKasUNhxkEtpGWJSy8h2giYKaOcjZ
        dN+YEpMPA301SXxROxU8X2uuebCDEsE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-iqrmG5aJPyeFdRGqrq4bQg-1; Tue, 24 Jan 2023 06:09:23 -0500
X-MC-Unique: iqrmG5aJPyeFdRGqrq4bQg-1
Received: by mail-ej1-f70.google.com with SMTP id kt9-20020a1709079d0900b00877f4df5aceso610970ejc.21
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYWcGPAz6QIYZJJbGq0zOHIyyGv/CshPeC5FZEnQikw=;
        b=z/mW6kAs1AiJQGii0xpQn3IYWNdfIx8Jz0+UdwS6Sk7+qYnr63/3VI+Af3ZZ2N6wFM
         M1o/mwUorA8HMES1IIbb6BiQNYE6EUagaYpTm+CWQXUBKEfcWrRMMS1irpwVzYSRk56L
         f73O6L1LYOt1ckuG0h5RoNHYd72EQcSR3xRtxjEmUh2g6xms0EgtLE4nbw+gNud201G8
         +cXARgdxIP6QkKmCpDhsVnIJ16qerPz1Ua19qXdKt1eQ98FNRxF0gT79P8MhI07LRPgt
         ynDqm5WI5loIC3jGlnOcwSWp/ZT85bdYWlIJt6COB8nzi7J864FlJUNM3DcRBLnARdLy
         nU6Q==
X-Gm-Message-State: AFqh2kokBKUQa9xipqrvjIYk2ugjzSXdICSIwttwE48wUDoh8ErZEqUA
        Tbfv9bm8iJY0m5zZLdbJNjau2YPzdJJ+o0ufq38LNUWqf5+TNrjZVoUkbPxrXNfhzGdid0lBHxU
        ouVIYTWFkD1FZvWpgE2v31VQ=
X-Received: by 2002:a17:906:4a8f:b0:84d:3403:f4f4 with SMTP id x15-20020a1709064a8f00b0084d3403f4f4mr29129979eju.64.1674558562109;
        Tue, 24 Jan 2023 03:09:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsFHNXVUfRaQzLzoCDaiVwwwHwen6bSo1ycB5sNIugxNbIRoF3kIXwYBVq4ttVjp3ACbTm2SQ==
X-Received: by 2002:a17:906:4a8f:b0:84d:3403:f4f4 with SMTP id x15-20020a1709064a8f00b0084d3403f4f4mr29129967eju.64.1674558561910;
        Tue, 24 Jan 2023 03:09:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gv41-20020a1709072be900b0080345493023sm735155ejc.167.2023.01.24.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:09:21 -0800 (PST)
Message-ID: <d8cd94a8-88a5-d169-636d-a5bfb8776869@redhat.com>
Date:   Tue, 24 Jan 2023 12:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 14/57] media: atomisp: Check buffer index is in range
 inside atomisp_qbuf_wrapper()
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-15-hdegoede@redhat.com>
 <Y86b86l5Bi1mb7oj@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y86b86l5Bi1mb7oj@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/23/23 15:38, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:22PM +0100, Hans de Goede wrote:
>> Check buffer index is in range inside atomisp_qbuf_wrapper() before
>> using it do index pipe->frame_request_config_id[].
> 
> ...
> 
>>  	/* FIXME this abuse of buf->reserved2 comes from the original atomisp buffer handling */
> 
> Does the comment belong to this check?

Yes and no, the whole reason we need a wrapper at all is because
of the reserved2 abuse; and likewise the index check is also only
necessary because of the code below using index. If it was not
for that, then we could simply rely on the identical index check in 
vb2_ioctl_qbuf() itself.

Before sending this to Mauro I'll amend this to replace this comment
with a comment above the entire wrapper function explaining that
the entire wrapper should eventually be removed.

Regards,

Hans



> 
>> +	if (buf->index >= vdev->queue->num_buffers)
>> +		return -EINVAL;
>> +
>>  	if (!atomisp_is_vf_pipe(pipe) &&
>>  	    (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING)) {
>>  		/* this buffer will have a per-frame parameter */
> 

