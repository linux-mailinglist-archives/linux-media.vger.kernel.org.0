Return-Path: <linux-media+bounces-7304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901687FD1A
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 12:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE44F1F22D27
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 11:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E511CD13;
	Tue, 19 Mar 2024 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KU1WbYd8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4246A7EF12
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 11:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710848717; cv=none; b=OJKeHcgMMD4njYnTQHtN9KkpFps+pSPDUDxTxz/YTzst+i7lMQg8Bh9rLCJqG9XA6tzGqBe/4j2aBRGdSbYCEt/iqIfzWQLtEqBADqZL0tJHN0k94lbhgBPzIbVMX1jTwErYP4dObUQRIlagN9qGmHRQrqyfS+Hnd0QerOwOCn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710848717; c=relaxed/simple;
	bh=L7XeZZ15BWK335jQJNvRDQqkoRdTn2ML2oXDPYosfEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQkBhlDr2dPYMcp0GSZCdW0DPAUc+1q+eesbFwzpa8DnCjQEX1A8IHijqXhsv/t1fZcwQG7vt0O+j9ihdyEmWSHohutxCZwX/A7MzmuUnFMS7207u6x+H3Ti5tjg6UT+fUJhpkwb9sZ8JgWY8xhWbcIyW/8yf3iY3vHfBYoSAl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KU1WbYd8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC167C433C7
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710848716;
	bh=L7XeZZ15BWK335jQJNvRDQqkoRdTn2ML2oXDPYosfEM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KU1WbYd8HEh1nfUN/xI3SRuuxz+nr0QWeGdxmem6nmw+MxkdF8nn3MEu73oDVIfHo
	 6y7X6ltJ2UPYFQx5/JktLYXbmzwJK/tKQsej8tcMlBo7GogeaE7F3FIvUTeGmrzI5Y
	 TxqezWax2fk55Jz345Adq3yyskAZtPWcgsmO8gx+SdYogBDobTd5Yrf9zaPqJOQz9P
	 r50ABHacYpSHGukt8ka7b4u4dGWk2GnlnIN+hVhCSLqwD9uY/zS9CW9ZA1M63KMq7O
	 dCJPCwpJIuNrMWABbCk2SUASKB3fahCJUy0l064SArAIciec5e7/9p7otJc7JbwyPa
	 9DcUWvKR1BNwQ==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a0579a968so58348397b3.3
        for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 04:45:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/hmFk/uCXkYEhrqAzer01K4/MSgVglQIsivzpjXF47GGrl9VegMLtr5gepd/pyh2Ey8+dWPVk6yy3vvXtu4eruWVYwgVP14UCSAc=
X-Gm-Message-State: AOJu0YxhOVfzybkpL5q+eDHjJ69Cyk0OJbs2id+yZD3WCXl+I+zT5x66
	NU1TvtCCrvhRFXirDVrLtFG2EaOGYgT+jwN/S4reMo+ax09VujBvOSUkqh+OkyfRLnJ2oXY5vHj
	SZxHMbSxjxsOVH7enS0GYdqSnydc=
X-Google-Smtp-Source: AGHT+IElB0w+UPnIGHGwNzyqS/KGvvVWpDicIjMddjYP/3Dn+A6TNNoHYQK3NlWlFzkSYnqVJ83tTlcxROJ5UakTofk=
X-Received: by 2002:a05:6902:1346:b0:dce:2e9:a637 with SMTP id
 g6-20020a056902134600b00dce02e9a637mr11979351ybu.20.1710848715891; Tue, 19
 Mar 2024 04:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315041028.25273-1-irui.wang@mediatek.com> <20240315041028.25273-2-irui.wang@mediatek.com>
In-Reply-To: <20240315041028.25273-2-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Mar 2024 07:45:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6svqr9r=Z16k94z8Wa_yWLSc_hg0-Gu7H3E4HutCji5Q@mail.gmail.com>
Message-ID: <CA+5PVA6svqr9r=Z16k94z8Wa_yWLSc_hg0-Gu7H3E4HutCji5Q@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: mediatek: Update MT8173 VPU firmware
 to v1.1.8
To: Irui Wang <irui.wang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Longfei.Wang@mediatek.com, Yunfei.Dong@mediatek.com, 
	Andrew-CT.Chen@mediatek.com, tiffany.lin@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/178

josh

On Fri, Mar 15, 2024 at 12:16=E2=80=AFAM Irui Wang <irui.wang@mediatek.com>=
 wrote:
>
> [h264 encoder]
> improve encoder quality
>
> [vp9 decoder]
> parse intra only frame uncompressed header
>
> [h264 decoder]
> manage decoding dpb list
>
> Release Version: 1.1.8
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
> changed with v1:
>  - fix commit message typo
> ---
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131380 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/mediatek/mt8173/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
> index e966b49bee57e8cfaa3536174830916cf35b184f..06aa3fb83b4e8d9b6921f7429=
b66c37744aad4a9 100644
> GIT binary patch
> delta 550
> zcmajZJxBs!7{Kx8)H^LdDzh)UO6|)m4vLDVAc?@uDWSQksiDCkFbZ<5ZfkNl8X`hG
> zQV43wrM0$(8VZ`-gogeXwiUkcyZ_z$ymwsb<whx?>{GS3ipW*P45^8zZi;-K$<Nwi
> zJ@2~YoxQSYp9XI=3D+Y`txxmS#NJGXY{GD;63k-CVE1d_O9&!7vf`(?U{jk=3Dv)ug25a
> zR}q!(A5e|PK194UOMT8h_0z>CkpSJMLFc(45^|m!{K-!E$jTS3yaHFv%DcY`1>ID{
> zv5EbbL;4qIevFfU=3DD+Va^K)FZId^R;Dd8g3HV5ySKNd4hH#|_G!3!Tc&<Q^R2qJ_o
> vbfX7h^df>j^kV>n7(x`o&@qBhj3I_N5*Wt>CNYI+Br$^&W^0+|TyF0h_inlQ
>
> delta 550
> zcmajZy-NaN9KiA4-Fc_wOJ!DOubRD?L<CV&kVqgzG(<v^b5nzZn?r+Jr2PX9{s9M9
> z2~rKYv=3D(hq1VLjs1wupL2W%^R;B()*=3Dl9%k)#ppC3fp5^EnDQ;J`b3&$WB=3D#47Cnf
> zPsh51Dk5)Xr|fT7j?1^VW~_@i*{vIW*}fBrH${?I#ReMeZPHZdew*&%py{O2SJ71N
> zMa1OmXVjuA?;>uRqaL+Sy)^wG;-h)$SI;exfO>B6Cr81PTA@@cXwd7mg7IA}?pHKX
> zPI1xEpnp;GTipLM|9wZzAMx7d+($)A2p9S6a`20}Udpr$xM0G98y@ta7hd?_M*w~3
> u#{hyDL<mC|#t6a~MFe9Q#{?!Zg=3Ds_)!wlk>#T@3bfJG#*RL``N+58V|&cV|F
>
> diff --git a/mediatek/mt8173/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
> index 55a49ec244539011213928bb66909a3564af703e..e91505e1194347a47ea9e48af=
ce0ca9a790b37ad 100644
> GIT binary patch
> delta 10973
> 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
A
> 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
> LP2R>Es2}|wL!|Yo
>
> delta 10312
> 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
> OY!32x-jzKHJ@7w;@g&3m
>
> --
> 2.25.1
>

