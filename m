Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816116BCD30
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 11:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjCPKsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 06:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjCPKrt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 06:47:49 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312CBC0832
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 03:47:33 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso778936wmo.0
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112; t=1678963652;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TaqsbmrkkQniuXxgJPYuHyiP2ltwHjzl4YEOyNL3Lvk=;
        b=3xUorfiIK0bN8PvNXiOcmNtaFaX6HSqOtsGSnixqQpHqm8QW31ljoiNosxG3cN5S0P
         mWfoArqJ7ogt+7SLICiJJ/QWJhnTZMEOU422IRgHlwsTWql0FoF2NbrVtms9LmDTgFxw
         NBwCyB2OGUQmHXSYDHAguEqeWZM2YcdKOmCTqk/Cy5MFVZqkk/XZ/NUWdMaziCvTb54g
         8vDlaJMtZyL2TDcA+8xBI7vtRTlH9ZYqEcCHTi3qNVhi481E/X+9xMbLBYckxIvcV3IC
         mQMPiC0KUG+qfXjfHDcS0pPHv3ZR8vrxdkXqqnFW6LUiXR6b7aMnfJmbEq1Mva4gldtC
         ud/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678963652;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TaqsbmrkkQniuXxgJPYuHyiP2ltwHjzl4YEOyNL3Lvk=;
        b=A8cwKSbDh8acgaV2PAf09gVvkuonQqq83ZfczbTEMtY5tmOdKGIzSf/Lmni70RrbRO
         OGOFYKm1kYYUdJGXeJA9rptVG2zshWqURIHxvbextvYSiyqlwi6NAYUwEcYJkhQcLlAR
         MrCx9Z3xZV3KVWmskyqiMMsGiErNGYu6qbXpgmUmgekI0L2wrClvL3fDLQ2tjpMMIFY9
         6jUtVhaCasdIAoE1D9zMXMlqroATnxRApZRlYdsVs9NzpUCS1Mfg5yGrZXLSCV8fuFP5
         qqEFY0ejuoVDILKztToFlCLhU64OhTNH5eZMBOpDrdurJTzb9ZT27cq3dLXUBiz9VI/o
         YyPg==
X-Gm-Message-State: AO0yUKU/nL8ohZHPjDIePivDk2og+PaCUU6aWggoz6rJ+1TQ0xFRkOG/
        hNrXtHcgNssdK9Dr1QoDaKCYCdoqnOUs1WhZoRc=
X-Google-Smtp-Source: AK7set9GmiZR031pCsEMKWs5UIENXD9yrVt6P+096w4UUIsAK6x83VXYTs0l3voupGXPw7/5rWeSQg==
X-Received: by 2002:a05:600c:c0b:b0:3ed:2dbf:6a80 with SMTP id fm11-20020a05600c0c0b00b003ed2dbf6a80mr6574561wmb.5.1678963651863;
        Thu, 16 Mar 2023 03:47:31 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003dec22de1b1sm4718046wmc.10.2023.03.16.03.47.31
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 16 Mar 2023 03:47:31 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 2/5] media: v4l: Add Broadcom sand formats to videodev2.h
Date:   Thu, 16 Mar 2023 10:47:32 +0000
Message-ID: <jos51i1itblq8smtmtjjcobdcgqiu6uklp@4ax.com>
References: <20230310194121.61928-1-jc@kynesim.co.uk> <20230310194121.61928-3-jc@kynesim.co.uk> <5cbe4d25a8ee52eaf245822ce5bbb97366d647ab.camel@ndufresne.ca>
In-Reply-To: <5cbe4d25a8ee52eaf245822ce5bbb97366d647ab.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Hi John,
>
>Le vendredi 10 mars 2023 =C3=A0 19:41 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> Add fourccs for Broadcom 8 and 10-bit packed 128 byte column formats =
to
>> videodev2.h
>>=20
>> Signed-off-by: John Cox <jc@kynesim.co.uk>
>> ---
>>  include/uapi/linux/videodev2.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>> index 1befd181a4cc..a836322ae5d8 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -656,6 +656,8 @@ struct v4l2_pix_format {
>>  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12  =
Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
>>  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', '2')=
 /* Y/CbCr 4:2:0 8x128 tiles */
>>  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '1', =
'2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>> +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', '2')=
 /* Y/CbCr 4:2:0 128 byte columns */
>> +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', '0')=
 /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
>
>I really should have asked on first review, sorry about this, but where =
does
>P030 comes from ? I didn't find any new format that would be called
>V4L2_PIX_FMT_P030.

Its the name used in the, already upstream, DRM definitions for the same
format. I thought I'd try to be consistent.

Regards

JC

>> =20
>>  /* Tiled YUV formats, non contiguous planes */
>>  #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  =
Y/CbCr 4:2:0 64x32 tiles */
