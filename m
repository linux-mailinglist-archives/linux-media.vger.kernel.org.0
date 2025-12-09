Return-Path: <linux-media+bounces-48493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09673CB10C3
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 21:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D231230C58B6
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 20:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B8E2BEC44;
	Tue,  9 Dec 2025 20:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vJNrIu/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485EE1A38F9
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765313235; cv=none; b=Y1WKeRF/tUOxYUTjS+iXVY9Qtki6PAfv3zeIpAMk4nHgx5wD/7pLUAru1+UOP5lYEIoFGCK+UaM00ghdBEKMqHp0PugRpDV12J79+UdS13EuIp1DyE4z7Wfq1MM7FXQM4kqKnaCqVhU8ZutzBfgONhYKXj9dZCdN3m2J6gomeaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765313235; c=relaxed/simple;
	bh=tPo61BjFSIsTiq+qr9Xq4v+Jwo/eWZ9R2CBvQUlX28c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nrZ0odXGbYA5itvgwsFgjnm47Wb5UJRHnvtVjZA2nlHNVqB/viA1QHoh3Etp2x5/epDeUVjp+aRXPgAegFiQXLoTA5gB6SnT1xRyBP4x7/oDJecEgTAHGb2Jb3v5Q4XnHZktWUTUYaFxeKwATwibs0494G//XvEY/huNNfdvy4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vJNrIu/Z; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ee0ce50b95so2249831cf.0
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765313232; x=1765918032; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=;
        b=vJNrIu/Zmy2YsrDM+80oDyeNT8NmeTaZ9Eil8EA5TRJ8HeFn3Qyi2T3mYgu7ZIrBQ6
         Kaosru+tSxTm9nu1PY8LMr1lsaW+n3Jx1aVDWHOloBboInPCHzH1RLnhw3Ke6Wq/5lW1
         xPLI0ceESMcjzS9+AlnejJvAi6n4UxJDI4CFeNbnq2+032DLMyikYlkYXPkF0rAnvfnG
         qjqLTDJCt2Ti58lbVX/A3K8vlhXeG3ftf08GxQAG3QliQ4TpWvc09t52SClD/jpxWsP6
         t1eTbzpRm4SVcviex6Yj0TTFOMcX58y4YeThexixELTaZ6ki++arpokfgXD3L5XI77Sd
         fwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313232; x=1765918032;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4INrajJZxer3eDvKBBVTy/6pmKf+B5vk/ryF/UUlog=;
        b=TF6x0jtV7pt4tfjP0AsryMwDDbPX3eflTvP9nlQRTuWQg69E1N7NqRec+RDLjAqvKD
         8TsU60M7kslGAfgnGkSLE4G8FgVAhzurz6jdG9HYjeGw/7ks71xPMf0YDJwkrbVa98Vs
         xAxpsbjK4URnJqO4HFMsRwmh/Jg0rRDpGuHqmlXdYWAu2m+/2yEFgMbxeyWBYNN56Cro
         eYQvbfdxLJyjwZ/pNgO6iqmOX+4Zc3cjNTQYtNWpeCsuxFiTahTsdfMFZPSaFtc7R/08
         9g2NHubmLILaOqUMui0d/V7F0APdTIrRx8lR+lNUQt2DFNd+cPbOladq5j/wmUKTJqWf
         l8kA==
X-Forwarded-Encrypted: i=1; AJvYcCWMnPi9Ig5kk14mpfycOGEAD1TMyr+tSAA20rTn8Y69Zk9sH5JuTpiUFFsmxkavSTxpwaBZihhCbjMihQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaxi62VSBbpJTmrTSelTS2tAUZ3tGEZrs/3KtWuK5wMTP36Qsv
	NQUjPm/dexoO4/nDo92egd9k6ymUfH1N5GDg7hdkqnKtsyhFBmTrsrkK8EmuFXKnwKY=
X-Gm-Gg: ASbGncvXQTQO3JLPRoqqrb9lxa8W+hSgxCtLTz61M1eAkjlPHPxIDXsAcu35DBEIEMV
	EtgsW4dmUfv/wA0zIz0zFJExZ1SCgiZSaWMDJq0QrlGFNsrvgmFNH9SVdPBH4D364ik89ZIoMi/
	DJHBMnbewsP9Zzg6I29APgNIkYy+9Zxx/GVphGVMQT4xErdzjnBtp52YyPkGmqeok4Eqomzh6dl
	v8anlvoQnL7RzaWI3VYavzbeIX32LwPwyqZOcmsfzq7PzYvBXrnRuknIdMfH1KBvzdRpDhodkOK
	UX2sMvcecBsmjtaTx0o2v3nKcq19TSKsmsI+NIKQhqD9MTiq1jaETO+HwpknO1nd75dwRENv8DG
	BeUXuRzNuvjNRWzpznVwD2BtmJshnf57OVuuZrS1GTSmbQzSMoY1obVAVCjIV8PqG4tW6SjDmHw
	2AplxUhN+4gFLYRU1f
X-Google-Smtp-Source: AGHT+IEoy3WsJss4eewDF1IObVZFsEEO8RMc62bsDTegGuaNornhGcbzFkR2E0lJrV1isVMQC9W0cQ==
X-Received: by 2002:ac8:7d86:0:b0:4ed:b570:569 with SMTP id d75a77b69052e-4f1b17f042fmr1022671cf.27.1765313232127;
        Tue, 09 Dec 2025 12:47:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f027d2b3a4sm108009241cf.25.2025.12.09.12.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:47:11 -0800 (PST)
Message-ID: <e0144120e0943b94454b1cddd5359c34b5a15412.camel@ndufresne.ca>
Subject: Re: [PATCH 5/5] media: platform: mtk-mdp3: Change
 cmdq_pkt_jump_rel() to cmdq_pkt_jump_rel_temp()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar	 <jassisinghbrar@gmail.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin	
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen	 <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang	 <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao	 <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, 	Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org
Date: Tue, 09 Dec 2025 15:47:10 -0500
In-Reply-To: <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
References: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
	 <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-MnGLK1uGO3sHzXuy/5rZ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-MnGLK1uGO3sHzXuy/5rZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le samedi 01 novembre 2025 =C3=A0 00:02 +0800, Jason-JH Lin a =C3=A9crit=C2=
=A0:
> To facilitate the removal of the shift_pa parameter from
> cmdq_pkt_jump_rel(), current users of cmdq_pkt_jump_rel() need to
> transition to using cmdq_pkt_jump_rel_temp() before the API change
> is implemented.
>=20
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index d0b0b072f953..5fc9263ccb78 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -628,7 +628,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct m=
dp_dev *mdp,
> =C2=A0		goto err_free_path;
> =C2=A0	}
> =C2=A0	cmdq_pkt_eoc(&cmd->pkt);
> -	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp_idx]=
);
> +	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp=
_idx]);

I cannot take that right now in the media tree, as it won't build. Can the =
SoC
maintainer help me know if I just leave that on hold, or perhaps you'd like=
 to
take it ? (or its in next, and I just have to wait for next udpate?)

I also doubt patch 4/5 is make much of a difference without the soc changes=
 ?

regards,
Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;

--=-MnGLK1uGO3sHzXuy/5rZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiKzgAKCRDZQZRRKWBy
9HnQAQCvZCLQCXpFlsUfn7DWx1kuIT+I+byuKT/dhCrJ0Qly3gEAh9feswFfhKgL
He/DKiOx62zT1aAhbBCmngiS+Tir/wg=
=/OPV
-----END PGP SIGNATURE-----

--=-MnGLK1uGO3sHzXuy/5rZ--

