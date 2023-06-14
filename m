Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F52730421
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 17:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236748AbjFNPsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 11:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjFNPsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 11:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4446826AE
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686757628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=C3a+D3C/eeBbkodn0MdgOMn17x/L2fD2fZ5pEx59nVo=;
        b=dSTDZSgZONAtIz+8CfiQk2KJo5wSY8+TzDmbaDSsLv2FQK/54FT/4VTAlyc4yPxz2qVa3d
        rOIyY89/ukyeTAMS0pLIrt+3v4Kh3tVD+fNg8ad316bU8YvHtw6I12BMKlwcmg7jXiapY1
        k6zqa+Tqc8V7TCELxP9y5iJTxiN2jrY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-Vd3NlRwEMg2tAmAtXsWA9A-1; Wed, 14 Jun 2023 11:47:07 -0400
X-MC-Unique: Vd3NlRwEMg2tAmAtXsWA9A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-98281e071fdso37803166b.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 08:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686757625; x=1689349625;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C3a+D3C/eeBbkodn0MdgOMn17x/L2fD2fZ5pEx59nVo=;
        b=PkxfwxaZbdGEddL0Bt6qyFWPMmORMTrPHNJHanLyD7DO5xKjjoVaXyuMzw0vjBNlLy
         woiyj5aVG7XoaLSI6m/RfTrOq5HrZZFKlWvvpyHkOepYPBNvmHEbYmbewp7vVrt6hHiS
         PWmIL+L0rQuhp659W2RPDAoF4pLWbszmza5LSUrubGRShZftbvn9PUtj4cNoLlQygaLY
         cYebBjEHIvDEp52kI4Wn4HdQtgGHIYoVnaai3KUBq5Jw0t7e+eedkQeRwQJ8oR7Qkdij
         1Us4FgUkpeoK4tjFgnmZK6YsUHmO0GFDczNUPvGuXRnjg6lpkRxtYYu2QUunpHNOEAaS
         wfeg==
X-Gm-Message-State: AC+VfDw8otme4vUMTvy5FveE7YmEccY0QGIQLYADwcClIGoLFiYpjZlL
        nPX2SzoqBFp08l+nKS1J6y62SJX42ZQRuunb18026M4MpR3iebGychVq4RD3Gyxte/RscNROjuf
        o0ISuRUMNeTahWTggb310pd5zBSLQWTs=
X-Received: by 2002:a17:907:70a:b0:974:20bd:6e15 with SMTP id xb10-20020a170907070a00b0097420bd6e15mr15881540ejb.4.1686757625367;
        Wed, 14 Jun 2023 08:47:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oLFcev992fc8/GhDtu99lsvmvYvjnaagosygFmvbrRaiFReYZ+JdmWsVOli0x99RjZH4TZA==
X-Received: by 2002:a17:907:70a:b0:974:20bd:6e15 with SMTP id xb10-20020a170907070a00b0097420bd6e15mr15881532ejb.4.1686757625052;
        Wed, 14 Jun 2023 08:47:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i24-20020a17090671d800b00967004187b8sm8111786ejk.36.2023.06.14.08.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 08:47:04 -0700 (PDT)
Message-ID: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
Date:   Wed, 14 Jun 2023 17:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: OV5693 Kconfig missing a select VIDEO_V4L2_SUBDEV_API ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

The ov5693 driver uses v4l2_subdev_get_try_crop() /
v4l2_subdev_get_try_format() both of which are
only defined if CONFIG_VIDEO_V4L2_SUBDEV_API=y .

Yet it does not do select VIDEO_V4L2_SUBDEV_API
in its Kconfig bits ?

Note I've not seen any build errors because of this,
I guess we somehow end up getting away with this...

But still I think the select should be added ?

Regards,

Hans


