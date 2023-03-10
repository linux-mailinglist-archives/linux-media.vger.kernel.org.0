Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B276B33E1
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 02:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjCJB6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 20:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjCJB6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 20:58:30 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01AA66A1FE
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 17:58:28 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id kb15so3951570pjb.1
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 17:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678413508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOHM7hx5EEMDKvTiLCYsUEf17unyK56ZY6RqHsSepXw=;
        b=h2RJEB0oKuuRghDyHy+d9JsKazt80mvgIAKvVN3Z9HYjN0+smoL+JX3Zvs9fzujhA+
         hN8PuMXcAIRBGrmFZG/pC6BHTAopBJOFc3ojdvNTki3xmUxIGS5zKoFQCuBzEMkl6EeM
         4i5pbkQo8OqTvLhaEWVnPdByLr5FDaRVthYEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678413508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOHM7hx5EEMDKvTiLCYsUEf17unyK56ZY6RqHsSepXw=;
        b=auA/DvfVL/Xn2d/mufQjY7jNBGQXmYUYZ8UuX+6Huu4Pmk2sMlXLdCk+ZBq2cUK34b
         35/otgtQbo9BDdLTQhLVOuKsu223HN5hd8/OSTsekYddlmtHrVoz3qUzW6udgdQiHlLS
         JdSQBuPUPGG0CVxmeQe4+q/nvcDlwq/4r9AOHs9WPPpInJyQuq2M33szJZZ1MX3Bc1mW
         +dl6N8zmXq1Ov+KY3E5SYlWq0fxw8BMIAukzX8bfs08c60gMWdFIeF7vYVntsSMcLOLR
         ejWgXGrSRPcE4ghKZ4iyHwUP4ODGplY5biFY/1WE0Sr/ZG7pJXfs1e4zok4drEgGFncm
         Z67Q==
X-Gm-Message-State: AO0yUKUUIBrWiyXr14Eh73rvsgerJVYrrZ3vcHT/TNpuH8eqlPsc2JqC
        LLdcXYMMFF0StgZQ6MWomMFyjQ==
X-Google-Smtp-Source: AK7set93GI4rNtTpiCVl8r7LAQjLCFL0zv4sIIg5FGgISkNCVib2TBY+Dhh7jqKYJwndIHdBrjn59Q==
X-Received: by 2002:a17:902:d2cd:b0:19c:e484:b4e with SMTP id n13-20020a170902d2cd00b0019ce4840b4emr29927682plc.59.1678413508503;
        Thu, 09 Mar 2023 17:58:28 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902ebd000b0019aaba5c90bsm270403plg.84.2023.03.09.17.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 17:58:28 -0800 (PST)
Date:   Fri, 10 Mar 2023 10:58:23 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>
Subject: Re: [PATCH v6 2/5] media: uvcvideo: Quirk for invalid dev_sof in
 Logitech C922
Message-ID: <20230310015823.GF1045797@google.com>
References: <20220920-resend-hwtimestamp-v6-0-c7a99299ec35@chromium.org>
 <20220920-resend-hwtimestamp-v6-2-c7a99299ec35@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v6-2-c7a99299ec35@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/03/09 13:55), Ricardo Ribalda wrote:
[..]
> Bus 001 Device 044: ID 046d:085c Logitech, Inc. C922 Pro Stream Webcam
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x046d Logitech, Inc.
>   idProduct          0x085c C922 Pro Stream Webcam
>   bcdDevice            0.16
>   iManufacturer           0
>   iProduct                2 C922 Pro Stream Webcam
>   iSerial                 1 80B912DF
>   bNumConfigurations      1
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
