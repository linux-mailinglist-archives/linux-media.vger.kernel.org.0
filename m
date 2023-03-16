Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 796A86BD2CC
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 15:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjCPO4B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 10:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjCPOz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 10:55:58 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3049DC4EA4
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 07:55:56 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id op8so1370954qvb.11
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 07:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1678978555;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bo4qhyPpOKyPIgw8a5mXa0Fsm5uGfvd7MORWLIGkChk=;
        b=2lQPTkgjgmRumNcBtZh7zkAq88OVseBYOUH8MwpSXv+09hZuTzVugB4Sltw5dw5zz1
         EhWcOeSkMQsbtW4v4L+F0MaXxP8sbigWRLJIgcPbH0FcodQJMbWhv6kyerlDrPwwzYo7
         fdz9D4U99CNwp9BKrQ71ZkznWT2HY/Y8HIj4G/O3SjIgoa3zr82LfFPAMtW4rEaqrdKa
         ZEo/OUvjzHYomIIhJBPHb6vAZSwsPDDjbhYmS8JHcIzGNxbA1fW8/sXGNl5x2VAk/wDn
         RB9dE8zv0ejKfh0sgYCegLVIt5OcAli3wyutfzWlSHVwq7Gb3xElDntAjcDfr3Ub43xE
         fQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678978555;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bo4qhyPpOKyPIgw8a5mXa0Fsm5uGfvd7MORWLIGkChk=;
        b=bSUdY6fl9AH9p9QCGgbROE7PBqh+WLyq+ZdrVg1cJZEfbi3a33QfQ1vgRGHeSIjJUv
         OtMhx0yBltmaqmCrO4wIy1mAfXoFHQklrM0m4Uzbw1Jfu6wVVXSOc0l+UKtKosflbZCL
         f1wMOBlbV2x/lh4sSo3vVZLGuO0ezR/zzZGOkVEVxmmVBnEMshbdUmkUiL5sDT6JLw98
         zpo1HX7r3VY5BClxkbkt6xtFBwVeq++xZHllZchqLtDhqpdXAMczQDn1xpIc2of/zSfq
         WPmeIOv9rduBKg0VYEmH7RX/2WOK6MK0vRFWXXVU11GIxC7q+AGVuEOxyMaoCpxFd7kX
         3pNA==
X-Gm-Message-State: AO0yUKVHyQ5p6yInkPtjVWmeKbMRwrGfWY4YIO+znx2m7WBa/+a7w8Tx
        j0X6W5VF7XqFAkx2/sOkbXCniELne0bxlfxlsfU=
X-Google-Smtp-Source: AK7set9IF/f3TynAV2mv4fqDC45RrdlDmAAqRGBYHS0qvnNhhQqosqoI26IdZ7bXLZTjVmoqMerykg==
X-Received: by 2002:a05:6214:1306:b0:56e:bb43:a07c with SMTP id pn6-20020a056214130600b0056ebb43a07cmr36563659qvb.20.1678978555339;
        Thu, 16 Mar 2023 07:55:55 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id o6-20020a374106000000b007425ef4cbc2sm6036942qka.100.2023.03.16.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 07:55:55 -0700 (PDT)
Message-ID: <ebe57f64bb479698e065686c2ca844e3a5153240.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/5] media: v4l: Add Broadcom sand formats to
 videodev2.h
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Date:   Thu, 16 Mar 2023 10:55:54 -0400
In-Reply-To: <jos51i1itblq8smtmtjjcobdcgqiu6uklp@4ax.com>
References: <20230310194121.61928-1-jc@kynesim.co.uk>
         <20230310194121.61928-3-jc@kynesim.co.uk>
         <5cbe4d25a8ee52eaf245822ce5bbb97366d647ab.camel@ndufresne.ca>
         <jos51i1itblq8smtmtjjcobdcgqiu6uklp@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 16 mars 2023 =C3=A0 10:47 +0000, John Cox a =C3=A9crit=C2=A0:
> Hi
>=20
> > Hi John,
> >=20
> > Le vendredi 10 mars 2023 =C3=A0 19:41 +0000, John Cox a =C3=A9crit=C2=
=A0:
> > > Add fourccs for Broadcom 8 and 10-bit packed 128 byte column formats =
to
> > > videodev2.h
> > >=20
> > > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > > ---
> > >  include/uapi/linux/videodev2.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index 1befd181a4cc..a836322ae5d8 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -656,6 +656,8 @@ struct v4l2_pix_format {
> > >  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12 =
 Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
> > >  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', '2'=
) /* Y/CbCr 4:2:0 8x128 tiles */
> > >  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '1', =
'2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > > +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', '2'=
) /* Y/CbCr 4:2:0 128 byte columns */
> > > +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', '0'=
) /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
> >=20
> > I really should have asked on first review, sorry about this, but where=
 does
> > P030 comes from ? I didn't find any new format that would be called
> > V4L2_PIX_FMT_P030.
>=20
> Its the name used in the, already upstream, DRM definitions for the same
> format. I thought I'd try to be consistent.

Fair enough. For this patch too:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Regards
>=20
> JC
>=20
> > > =20
> > >  /* Tiled YUV formats, non contiguous planes */
> > >  #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  =
Y/CbCr 4:2:0 64x32 tiles */

