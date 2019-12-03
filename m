Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8C311037E
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 18:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfLCRbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 12:31:12 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:42102 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCRbM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 12:31:12 -0500
Received: by mail-qv1-f66.google.com with SMTP id q19so1858201qvy.9
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2019 09:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=sH33UhYXPcacj8OvAIq21YUkm8Gwg3M9E0b+bnRx7zk=;
        b=HaGHmimOrq6q+GjusItLdt/VOETzaJtudthqdvOzBVc5YZOmCOvOjYVz1WgBNZRkLx
         0pvb4WXOpfBdKf8lTsoG+trgzVC1gRk2VwJgwiNjNXX5mKMy4dQtovpTB7Wz1n3+OJXa
         fhPZlP2WdfHX8eARCidSG1UZGGu2495AMRoSoDtA0BSHeSZexKwUhczNMFU4rry52hvV
         zfP9/1YduK7NfcPk2vFH2HO2mL+2T87aXBcgsMuXmlj7puEy/xsHe+wtaVYmlyr5/S7a
         5nSYymmA9wAlToZ3CmCk3HGuZwMyO3nW8SBaAMQRj+y3iEQib4SfVq9DgBs1dKv3M6sz
         sOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=sH33UhYXPcacj8OvAIq21YUkm8Gwg3M9E0b+bnRx7zk=;
        b=CLrrBCdHJPcbdOpvyUQTm4KtuJ2EEt2lPsI0/wFmrDY1X0XaNtB9s/LW9bEryB2aSB
         sCQzdCJ+J9qgxzgoXMqQLxDkmHCjjM6Q1/ZZX/uzdlODerzMebBzaI92aYlw2h2134mu
         qaE+CJHxEhf1LXmKogLzoQT31bsN3Key61aYiimbzR16MynD9oSLI2WZlavrf286vgiz
         rKbwgMCipr2bwIW/zVED5xFQk1jEjqRc8EppI9MOh9YXp/iERhTucxVhGMeampJjrVhq
         svc28RBo+svr1LbJCn3Wt4xSQyUuh7JhgE16al+OutfG8EAyvxIfm6SbJOA6qm7+/wc/
         gbgg==
X-Gm-Message-State: APjAAAW3ut07SXA3Lcw8+Yzi9/I2Oc5KvPx8sEjcRubQc/bWVQS1vni2
        2+q/VUTMeNW3HFGyUda+Af9prA==
X-Google-Smtp-Source: APXvYqyPqBtwcF/VIE1v3s6zU2r/O6IJJ6TsDWqLmDcB679RLmgmQuz11cQsrnPkXdXxSCAA7HzKuQ==
X-Received: by 2002:a0c:e9cf:: with SMTP id q15mr6192553qvo.137.1575394271215;
        Tue, 03 Dec 2019 09:31:11 -0800 (PST)
Received: from tpx230-nicolas ([2610:98:8005::650])
        by smtp.gmail.com with ESMTPSA id d6sm2109428qkb.103.2019.12.03.09.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:31:10 -0800 (PST)
Message-ID: <7727357a70f9ca95b652ae9c8d12945f60acf239.camel@ndufresne.ca>
Subject: Re: Unsupported format MFVideoFormat_P010 for Elgato HD60S+
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-media@vger.kernel.org
Date:   Tue, 03 Dec 2019 12:31:08 -0500
In-Reply-To: <bb2b6834-c8a4-9a3a-9549-b8c6e7f7120b@gmx.com>
References: <bb2b6834-c8a4-9a3a-9549-b8c6e7f7120b@gmx.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-S917E0jRgZ03e+GJNAMw"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-S917E0jRgZ03e+GJNAMw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 d=C3=A9cembre 2019 =C3=A0 18:44 +0800, Qu Wenruo a =C3=A9crit :
> Hi,
>=20
> Just got my capture card, Elgato HD60S+.
>=20
> Although it supports UVC, Linux still doesn't support it (yet?)
>=20
> [34381.339277] uvcvideo: Unknown video format
> 30313050-0000-0010-8000-00aa00389b71
>=20
> After a little search, that GUID looks like MFVideoFormat_P010, which
> looks like a 10bit YUV format, and ffmpeg looks supporting it.

This format is mapped in DRM already, you will need to map it into the
V4L2 enum, document it and then add the mapping in the UVC driver.
Should not be too hard.

https://docs.microsoft.com/en-us/windows/win32/medfound/10-bit-and-16-bit-y=
uv-video-formats

You could also add P012 and P016 while at it. These are not super
memory efficient in 10 and 12 bits, but they are compatible with 16
bits and are efficient to read/write.

>=20
> Any idea on the Linux support of that card?
>=20
> Thanks,
> Qu
>=20

--=-S917E0jRgZ03e+GJNAMw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXeab3AAKCRBxUwItrAao
HKScAKDVFlRDgjky9I4Zmvecf228s9TNJQCg26m4S/Z3iiZBZDtfJSqFHi8lGn4=
=iOxu
-----END PGP SIGNATURE-----

--=-S917E0jRgZ03e+GJNAMw--

