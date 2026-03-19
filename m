Return-Path: <linux-media+bounces-56386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCz4NvVlvGmYyAIAu9opvQ
	(envelope-from <linux-media+bounces-56386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:09:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A22D2870
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 936693017BD9
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C25B3F20EE;
	Thu, 19 Mar 2026 21:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="LX2TXQc7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CD33D9DC5
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773954543; cv=none; b=eDsx8URasRMbalwQtqQ2X2zIbyQLJupUHqb4vJz2DrwxsAwwptAR85hPopmnxO02hzXRokPFy071A2l07Kam9gTZaryOGz1U2UZVdbb78DtKrJ0pZydwdxrH1a2JeKMy6r/A1sQYFi5ZDIOQxBx8Gd4/DNiOTal8AFMU/TITNlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773954543; c=relaxed/simple;
	bh=8CMszLdlY0/NUEelAR0v025hIftqH9LzabpmqiAqBag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FCe94ZZH+VPsEhgOwnRu67hehdg/z2p00Ufny0R2uG6kifHFtI8AYQ5osJDwNBO5GppPNQ4nx2AKio04Rw4DpXRr89ZGrtDEwP0PGjqS4LWEofZKPYcZXPmORLj2svIBWGiLheV03ERKcHLcFZ3tzZMhX+dD5dzho3zX1PTqCgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=LX2TXQc7; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50b29c4e554so11933101cf.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773954541; x=1774559341; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NMbfSQLQ1xEd+7s0+CT4TDbp3oywa75VWIVmbsOBScc=;
        b=LX2TXQc7lT+A01/McmdSo9YaS6Llmah5SPGpz/gS95iUKR2w7tGPc2sQqKgf0IoV+g
         wqCRq8VHTqejwrnF+fIZoHEql8qkYjLKG+hVbPy6nspKDuiFa7AkWKot2qg2J+o154jo
         XFWdB1IsdxYWXfQ4KHaCCFYWQq3UB5ptHKImbZKd1urhFoTreECHat1LCM2eNi5/yvab
         4fNPUwWXGAENgKxsbVAwe4enOIx4atBpEuDu//T4p8yxLGPzGz82RvY2/u6fyvOPeH5C
         QqfaAIeFp2rPmTV+Xm2srxnZ4q6Q8CKnYytrmRpNDd1TZiRZ7Sw3xh5hbpu5cyfymkrN
         la6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773954541; x=1774559341;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMbfSQLQ1xEd+7s0+CT4TDbp3oywa75VWIVmbsOBScc=;
        b=A7UlgTEfuvlDkb6K7i/XgmwV8zhWH280JIrpn4YMigY+V6Wkmd8uTsXIq0P+JnBHp0
         hyMziPDAKAlORtKW0QnozWs/JAS/Eoza7GU4a8oEjRmVOYY85HRsms93qyhEBCH5H1g0
         YxedpB8bD2Mg4/+XvrYGPHRhvsm07fHzQ2d7CLjaExmwYDC+Prd8VxWC0TBrj59X0Y7O
         0Kk5s/cHjnlUOq6nI61okZrmJ4YshO5nKXSMQmgoUjV+s8HsWjNW94kcS/xt+KUEjJVB
         Hz5Q6eDG43Ps1kKAiLKy2ZTaDsnQDW+hdLu7Lqw/1fVdPMjJcsal5xfTx+iQZSnKX4ba
         n4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnZOUU0PWtYhTuHZ2Ej+9RfQdlsT6yATTqGLTM+xrgjenZ8oldEC4Ebz/gHhozisl8luEaCHLg5thwJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqF6vAE54bRC6uwAeDCt2vS2Y+AFunLlclGYHpGtMEwvA8I1t
	kMfP68CjkUbIoyNtubRn/bKKTxVaWG6LW6FDSUQotJTVHpgHe9GgGxgPfSJRS2KwSSE=
X-Gm-Gg: ATEYQzxWKdO81heIM9tw9rYSEoII6Y+Mlh95+PZisZKbg4jqVhMspazcbg95xlSV5pB
	p1ajJ5w+gUvdwSPOSXaD8J6ythPRjOOEI+Zimd/fWU2fm6O7zzumLyj+Wsv/ufPB7hBwk2umJtY
	JiC3sGmo3DV2N8ewwy2ysmEV1iVsAb6IK+lUxwC0uH4Va4QFnQ5gCCOQQ/utxaBO4TUouUpJPfr
	XQcLLCFQejJGiH4aKQxWzyHGKmwxIdrxBrVZro/7x2XcfoVv9h5UvWie+3rClqiVY+tNOJfezCD
	ctDU89Z5AK59fwN3QUintQS8hBH04Z82KTMP8Par2lT2trRzv+M0yt25H+PKxjhnTYeTDlpBbSW
	uanSGkc6p3OfUdDVuZD47TaLRmNb5+9hgOJceZigBkYW1D9t+3F1INx0OGwtKvILjOCmw7UGV+U
	4JEBBEaHpUZC126BtgFnbIAS1kC8jam7ix8mYC2/s=
X-Received: by 2002:a05:622a:8c4:b0:509:2527:d789 with SMTP id d75a77b69052e-50b373bdd66mr13176761cf.6.1773954540418;
        Thu, 19 Mar 2026 14:09:00 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85257c9bsm5961546d6.20.2026.03.19.14.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 14:08:59 -0700 (PDT)
Message-ID: <ebeb15d9479e651f31be59b797f4e95cf1713243.camel@ndufresne.ca>
Subject: Re: [PATCH 4/7] media: mediatek: vcodec: simplify cleanup using
 __free
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org, 
	m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de, 
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, 	matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, 	johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, 	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, 
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, 
	dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, 
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, 	tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, 	linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, 	linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
Date: Thu, 19 Mar 2026 17:08:56 -0400
In-Reply-To: <20260310200513.2162018-5-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
	 <20260310200513.2162018-5-sanjayembedded@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-P5pBQoC3BtsCjb7Hnh/k"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56386-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,mediatek.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E53A22D2870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-P5pBQoC3BtsCjb7Hnh/k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 11 mars 2026 =C3=A0 01:35 +0530, Sanjay Chitroda a =C3=A9crit=
=C2=A0:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>=20
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
>=20
> No functional change intended for kmalloc().

While I like auto cleanup, I think consistency is key. kmalloc is a tiny li=
ttle
dot in the sea here. Most of our leaks are in probe() error handling. In v4=
l2,
you find a log of init() with matching releas() call, which get constantly
forgotton. My suggestion would be to focus on one driver at the time, not
kmalloc across the kernel, and try and "port" these driver to consistently =
use
the cleanup function. This should also come with usage of quard() as its th=
e
same objective.

You goal should be to return at any point in the function without risking o=
f
leaving lock/spinlock held or leaving memory.

Marking as change requested the codec releated patches in this series.

Nicolas

>=20
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
> =C2=A0.../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c=C2=A0=
=C2=A0 | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c
> b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b..3184939f793a 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> @@ -96,7 +96,7 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, c=
har
> __user *ubuf,
> =C2=A0	int total_len =3D 200 * (dbgfs->inst_count =3D=3D 0 ? 1 : dbgfs-
> >inst_count);
> =C2=A0	int used_len =3D 0, curr_len, ret;
> =C2=A0	bool dbgfs_index[MTK_VDEC_DBGFS_MAX] =3D {0};
> -	char *buf =3D kmalloc(total_len, GFP_KERNEL);
> +	char *buf __free(kfree) =3D kmalloc(total_len, GFP_KERNEL);
> =C2=A0
> =C2=A0	if (!buf)
> =C2=A0		return -ENOMEM;
> @@ -134,7 +134,6 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp,=
 char
> __user *ubuf,
> =C2=A0	mutex_unlock(&dbgfs->dbgfs_lock);
> =C2=A0read_buffer:
> =C2=A0	ret =3D simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
> -	kfree(buf);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0

--=-P5pBQoC3BtsCjb7Hnh/k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxl6AAKCRDZQZRRKWBy
9KL5AP0StbOgEgmi9hNrOmp59Azp5ubjHNUiKBoy3k0YPFJl5wD+MXkfWFOYepSc
n+TSCme76s+FElTo92PrABWSwDA54g0=
=noWy
-----END PGP SIGNATURE-----

--=-P5pBQoC3BtsCjb7Hnh/k--

