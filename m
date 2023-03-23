Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6B86C6848
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 13:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbjCWM16 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 08:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjCWM1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 08:27:53 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586111BEC
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 05:27:52 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h17so20265880wrt.8
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112; t=1679574471;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=62+H0ZygKrIiE2qWF7n4GdEtJBFZ4C1OAglWaQqb+IM=;
        b=P4b9Gd5aMwMgrVr7QY8/RauZXGeNvzGnEXpZxSLRVka3c6hcInLeNAMiqjUViwZSkj
         3vxlCORF6YrCFY423T3TQRvWVhQgrAIZmHKuiAUsTx23i7yilWNrT23d+448LpUM2oIH
         Z5yBZRFvoLmyJ4oLQ3BT2yyM7n7mN8Lm/R6Qer9BU3bEjvFf2dPvKR6CsMSRlEj3/xug
         GP845sIkC6UqbonA2NHMvxIGpITIPJHdgaMc/umrCtLNuPV5KHyC21Eg67LKZUcdg1Rb
         b/pAeyyWmoHc7AW3szjhREcGWBQuNMS97NReN29TnYG7+Mj7etTd/hHdXFCWokSRkAn1
         nFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679574471;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62+H0ZygKrIiE2qWF7n4GdEtJBFZ4C1OAglWaQqb+IM=;
        b=YaMM0iBIajdA7p0dYixwaTVITMG0QMVvYUdobSR6L4CyOjtAP2ANAzFsWds+u1+hIy
         9M8la/8G5UN3WDGrvEYyosnZAL97q+8yyUoV/1fAyehtz3FGZEsnCbWsqVlCm+WP1JAs
         L2nti8mFBvVaf/+e9mE2+qVpTPWuWkuzyvpwi3FUR/V7s36EdUCOEq8wlM5lAK2rXQ5P
         U9c1ohwa9RzrHXHEBbd7+quMX9ir1Dq4VxckiV1EGlyDYPMtw1116e89Azzm2hREmeIa
         IHwgEre7wP0pQBH8KxlmfOXPVigj77VhMJDtEy9yHYRk/LgxID7l9Lz5y73oDUNWXuZM
         A13A==
X-Gm-Message-State: AAQBX9dlsjQ22ThPe+TPk4/uoThqirUFW8FDDyYqDmO6v1HryzdUoQKX
        t+hMRzpVVDn0xp5TWKZYwsswXc/Qm6T0tdpaWIQ=
X-Google-Smtp-Source: AKy350bsTIA13trtLKZiIMWIKgpqZi7w9iT/gl+YWYDkU31q+RE/9lDRDMh4lzauzBJh24m/MM60IQ==
X-Received: by 2002:a5d:5222:0:b0:2cf:f4cc:cbac with SMTP id i2-20020a5d5222000000b002cff4cccbacmr2464766wra.23.1679574470857;
        Thu, 23 Mar 2023 05:27:50 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id p17-20020adfcc91000000b002c71dd1109fsm16162899wrj.47.2023.03.23.05.27.50
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 23 Mar 2023 05:27:50 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 2/5] media: v4l: Add Broadcom sand formats to videodev2.h
Date:   Thu, 23 Mar 2023 12:27:50 +0000
Message-ID: <u8ho1il7jb4micd01q0e3hcnq51ham1k6r@4ax.com>
References: <20230310194121.61928-1-jc@kynesim.co.uk> <20230310194121.61928-3-jc@kynesim.co.uk> <5cbe4d25a8ee52eaf245822ce5bbb97366d647ab.camel@ndufresne.ca> <jos51i1itblq8smtmtjjcobdcgqiu6uklp@4ax.com> <ebe57f64bb479698e065686c2ca844e3a5153240.camel@ndufresne.ca>
In-Reply-To: <ebe57f64bb479698e065686c2ca844e3a5153240.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Le jeudi 16 mars 2023 =C3=A0 10:47 +0000, John Cox a =C3=A9crit=C2=A0:
>> Hi
>>=20
>> > Hi John,
>> >=20
>> > Le vendredi 10 mars 2023 =C3=A0 19:41 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> > > Add fourccs for Broadcom 8 and 10-bit packed 128 byte column =
formats to
>> > > videodev2.h
>> > >=20
>> > > Signed-off-by: John Cox <jc@kynesim.co.uk>
>> > > ---
>> > >  include/uapi/linux/videodev2.h | 2 ++
>> > >  1 file changed, 2 insertions(+)
>> > >=20
>> > > diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>> > > index 1befd181a4cc..a836322ae5d8 100644
>> > > --- a/include/uapi/linux/videodev2.h
>> > > +++ b/include/uapi/linux/videodev2.h
>> > > @@ -656,6 +656,8 @@ struct v4l2_pix_format {
>> > >  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* =
12  Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
>> > >  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', =
'2') /* Y/CbCr 4:2:0 8x128 tiles */
>> > >  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', =
'1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>> > > +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', =
'2') /* Y/CbCr 4:2:0 128 byte columns */
>> > > +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', =
'0') /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
>> >=20
>> > I really should have asked on first review, sorry about this, but =
where does
>> > P030 comes from ? I didn't find any new format that would be called
>> > V4L2_PIX_FMT_P030.
>>=20
>> Its the name used in the, already upstream, DRM definitions for the =
same
>> format. I thought I'd try to be consistent.
>
>Fair enough. For this patch too:
>
>Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Is there anythiong else I need to / can do to get this lot accepted?

Thanks

John Cox
