Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4801555367E
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 17:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352964AbiFUPmj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 11:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbiFUPmi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 11:42:38 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B927E2BB28
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 08:42:37 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c83so10404939qke.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=j+TmZokpENwEZtYw+9zpADRR+ouuJfl5CqudgyGGVMI=;
        b=rYLR4rn00kFhjq3jMMRY7EV3DBXR7qIPak/L8qbBz7KbspyXsDYwanSNawW1tKwOFH
         ewJrprj9XAeaMHMnCVlg1mhbGk8X6etye45/t42emj4n96CBFUyK5gOLOtftDOcdpZMh
         908EbU0jMLl63DlEFVUzOjzrIiEDup69vNvC3BVREh9cTbfasxeL2JzuFMVynhfUHn98
         SGF8a9JKO8Pf8V6BWlSMg2+9tMhrZdQC/G3V+w+lJ0Ok91h8ogWI0K7twjgTqZVkmTxE
         6XVNDuCjL70HX8cR/4q2TUO+k8WZac1WO63xDQo9PTA6W60gd87FacoEKmclkA3dwS9D
         TH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=j+TmZokpENwEZtYw+9zpADRR+ouuJfl5CqudgyGGVMI=;
        b=auA746uKnqDWqduu9BPSWr5XDCYMXoUDugfoSH5IVIi2NWORULyXXd1vyPG/DZZ41b
         Kv39vkiTuwcVKoISp+VQ11vITJBSknEDmWJcwLZOajpQXP/dHuGjvY/NUzfthxT+Qx4s
         yMcJkSXeECfcwrxrnxZOxFcB7p/nS/I3A7PZudhZWNbEK94FICjhHDqyArXiu79d+X7Z
         1fjg7P9K/bRsP7/cQj1SVV4BqK+ISTIKVPcTQw2ozZKW7Jsx2+O/1UGXZbAx9drtBXFa
         G9jPPEWTAcoBR1LxQLdtnrdEa69cAjsSg/7OWTiJIOs19d70C8nLwO+ZM8udvD6qjYJu
         N4ug==
X-Gm-Message-State: AJIora8x+JUiGMEzeyr3g6sEEeBNNgOuwikxWD7jYfwUJgP+cUP77gMn
        nYPe53A+JhbqgUwacEmd/Tnjrg==
X-Google-Smtp-Source: AGRyM1vE+SSLFEkr3ihfgV0r8gtNBCmLkJBjCPAUN5aHdi7vF4C6XWO85PiLvuKGcwPkdcTuFdcspg==
X-Received: by 2002:a05:620a:280d:b0:67d:2480:fdea with SMTP id f13-20020a05620a280d00b0067d2480fdeamr20435321qkp.157.1655826156800;
        Tue, 21 Jun 2022 08:42:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id w10-20020a05620a424a00b006a79d8c8198sm14389324qko.135.2022.06.21.08.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 08:42:36 -0700 (PDT)
Message-ID: <2aabc41c8432d09b7ceeb8e67144a639d3d86c72.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Andy.Hsieh" <andy.hsieh@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, lkml <linux-kernel@vger.kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>
Date:   Tue, 21 Jun 2022 11:42:35 -0400
In-Reply-To: <39f7f41a-af8d-4700-37da-9401455afb98@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
         <cdb508e49eb1439f4e4c327d2a6738f219e04bf8.camel@ndufresne.ca>
         <5822b325-766e-ce3c-50eb-d7f54f14fd0b@mediatek.com>
         <39f7f41a-af8d-4700-37da-9401455afb98@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian and Andy,

Le mardi 21 juin 2022 =C3=A0 12:34 +0200, Christian K=C3=B6nig a =C3=A9crit=
=C2=A0:
> =C2=A0Hi Andy,
> =C2=A0
> =C2=A0Am 21.06.22 um 12:17 schrieb Andy.Hsieh:
> =C2=A0
> > On 2/16/21 4:39 AM, Nicolas Dufresne wrote:
> > > Le lundi 15 f=C3=A9vrier 2021 =C3=A0 09:58 +0100, Christian K=C3=B6ni=
g a =C3=A9crit=C2=A0:
> > > > Hi guys,
> > > >=20
> > > > we are currently working an Freesync and direct scan out from syste=
m=20
> > > > memory on AMD APUs in A+A laptops.
> > > >=20
> > > > On problem we stumbled over is that our display hardware needs to s=
can=20
> > > > out from uncached system memory and we currently don't have a way t=
o=20
> > > > communicate that through DMA-buf.
> > > >=20
> > > > For our specific use case at hand we are going to implement somethi=
ng=20
> > > > driver specific, but the question is should we have something more=
=20
> > > > generic for this?
> > >=20
> > > Hopefully I'm getting this right, but this makes me think of a long
> > > standing
> > > issue I've met with Intel DRM and UVC driver. If I let the UVC driver
> > > allocate
> > > the buffer, and import the resulting DMABuf (cacheable memory written=
 with
> > > a cpu
> > > copy in the kernel) into DRM, we can see cache artifact being display=
ed.
> > > While
> > > if I use the DRM driver memory (dumb buffer in that case) it's clean
> > > because
> > > there is a driver specific solution to that.
> > >=20
> > > There is no obvious way for userspace application to know what's is
> > > right/wrong
> > > way and in fact it feels like the kernel could solve this somehow wit=
hout
> > > having
> > > to inform userspace (perhaps).
> > >=20
> > > >=20
> > > > After all the system memory access pattern is a PCIe extension and =
as=20
> > > > such something generic.
> > > >=20
> > > > Regards,
> > > > Christian.
> > >=20
> > >=20
> >=20
> > Hi All,
> >=20
> > We also encountered the UVC cache issue on ARMv8 CPU in Mediatek SoC wh=
en
> > using UVC dmabuf-export and feeding the dmabuf to the DRM display by th=
e
> > following GStreamer command:
> >=20
> > # gst-launch-1.0 v4l2src device=3D/dev/video0 io-mode=3Ddmabuf ! kmssin=
k
> >=20
> > UVC driver uses videobuf2-vmalloc to allocate buffers and is able to ex=
port
> > them as dmabuf. But UVC uses memcpy() to fill the frame buffer by CPU
> > without
> > flushing the cache. So if the display hardware directly uses the buffer=
, the
> > image shown on the screen will be dirty.
> >=20
> > Here are some experiments:
> >=20
> > 1. By doing some memory operations (e.g. devmem) when streaming the UVC=
,
> > =C2=A0=C2=A0=C2=A0the issue is mitigated. I guess the cache is swapped =
rapidly.
> > 2. By replacing the memcpy() with memcpy_flushcache() in the UVC driver=
,
> > =C2=A0=C2=A0=C2=A0the issue disappears.
> > 3. By adding .finish callback in videobuf2-vmalloc.c to flush the cache
> > =C2=A0=C2=A0=C2=A0before returning the buffer, the issue disappears.
> >=20
> > It seems to lack a cache flush stage in either UVC or Display. We may a=
lso
> > need communication between the producer and consumer. Then, they can de=
cide
> > who is responsible for the flushing to avoid flushing cache uncondition=
ally
> > leading to the performance impact.
> =C2=A0
> =C2=A0Well, that's not what this mail thread was all about.
> =C2=A0
> =C2=A0The issue you are facing is that somebody is forgetting to flush ca=
ches, but
> the issue discussed in this thread here is that we have hardware which
> bypasses caches altogether.
> =C2=A0
> =C2=A0As far as I can see in your case UVC just allocates normal cached s=
ystem
> memory through videobuf2-vmalloc() and it is perfectly valid to fill that
> using memcpy().
> =C2=A0
> =C2=A0If some hardware then accesses those buffers bypassing CPU caches t=
hen it is
> the responsibility of the importing driver and/or DMA subsystem to flush =
the
> caches accordingly.

I've tracked this down to videobuf2-vmalloc.c failing to look for coherency
during "attach()". It is also missing begin_/end access implementation for =
the
case it get attached to a non-coherent device. Seems fixable though, but "I=
'm
far from an expert", but more some random person reading code and comments.

regards,
Nicolas

> =C2=A0
> =C2=A0Regards,
> =C2=A0Christian.
> =C2=A0
> =C2=A0
> >=20
> > Regards,
> > Andy Hsieh
> >=20
> > ************* MEDIATEK Confidentiality Notice ********************
> > The information contained in this e-mail message (including any=20
> > attachments) may be confidential, proprietary, privileged, or otherwise
> > exempt from disclosure under applicable laws. It is intended to be=20
> > conveyed only to the designated recipient(s). Any use, dissemination,=
=20
> > distribution, printing, retaining or copying of this e-mail (including =
its=20
> > attachments) by unintended recipient(s) is strictly prohibited and may=
=20
> > be unlawful. If you are not an intended recipient of this e-mail, or be=
lieve
> > that you have received this e-mail in error, please notify the sender=
=20
> > immediately (by replying to this e-mail), delete any and all copies of=
=20
> > this e-mail (including any attachments) from your system, and do not
> > disclose the content of this e-mail to any other person. Thank you!
> =C2=A0
> =C2=A0

