Return-Path: <linux-media+bounces-57518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAKkI3hOyWmqxQUAu9opvQ
	(envelope-from <linux-media+bounces-57518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 18:08:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E9352CC2
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 18:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8CD430500D3
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 16:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E71937F8A3;
	Sun, 29 Mar 2026 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKW15+O2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006B1B4257
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800230; cv=pass; b=UGRdLlmiWCVPuHVEDvgkrIIWLg6R80omZ9nbhhk5B8WfyFKxkUylOEkupBuWnGQ+ugloYIc5ezGGu/ZERMbnb8wsSR03CfAA3SZtAc+YGzxedWR2ThNo8V+t0W8bOSCcK1lpOSgiBGZC1XyldwFMhYfGHtFT4lXZmWuo9JvlitI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800230; c=relaxed/simple;
	bh=BtnTEkpNJjJq/Vlq/rzW8E2863D+5gzyr9yuILBaGmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c16H+4d9U32aEKwp1lPPMpxfp/6iaVjUPTW6JimFzfJuEug9qI+g/L0+seyQVdhm416a8ZGxr/I1FEtRP66GrCcRV14WCXapjLpqPF/j0WGpnUJ50c0p9eAccHOPykHC1NFNCDNv92G0/fqv0U6w7Yx/zTYGfUv+y5A3IyGxmdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKW15+O2; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d744d9acbeso1479140a34.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 09:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774800227; cv=none;
        d=google.com; s=arc-20240605;
        b=OLE8eMcgHeFjDLk7Zz/RERGa7BItQVg4Wr655fKxxAb5tyN1Ow32eN0bqt4s4+AzUD
         3JfCGnxF9/xNzUF1a819dhoRlB7eODIv2TJtFFZUlc0YDro1ItloGODczxMDDNnx4kgf
         vGyK0rQKd6UMMpfKbzirZAZW08blkVAPTdGzAteFBw6l9rxUW2bc4xueNk2ystBL9N6s
         PTI6zv8lcagDnV6BX473H+xZp+Y5RS4etwdAdFSjaOHcikzhZdLyJMsLdF06CDRjhBMF
         aYpgT6HMVOYtxMS5DJQlnsijz+6i30nWJJ4mP2XyIIK1MPDxXkaPWHfV6YJH46vXSHq3
         KoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        fh=OadjVexGMNDJJ7eX/b6TMdwUDkqL3fyxx6Ez5HBLMXE=;
        b=l0dZAyIt3slxDwsSo41zQ8HOfdDGlf+Orr+hU/0jWyKtPHdHiwQ6dl/3+CUH5jo4FY
         eEsUThgE40Fw4aiFYNXRI55M30sYAgyF5bwsVEmVyHmkHEL/zr6ODQqKi3QLsH9xP6qQ
         nfUit9kIWZYMb3CHyHV95jJNIVStOlJsIKSWTK7/V2IQYMk/YGWalcf5Lyan28rfnGPz
         pkrUWdtolZ2vz/3tcKB2I3y3u5N9uuczcM2p7CNSQDIi3pNYrHBIlZxz8cc3htEHw/EM
         6o6n3MRhEmmwAbhyhu++2JzyiAOHJ5lJbxefIyTnybUQj7AU79lIh1bxjDga38hT0jr+
         FeeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800227; x=1775405027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        b=SKW15+O2QVij0uqnpTFdKMKM8IObHO350dm2AY4364ii+JKbSgWQfXHCr9BI/0UuFG
         PG2/8hsU3KFfEl1MAENcI0IGR54nyj+jhonpOzw96K/Wzp/fnd3UQmGxsc+g42+/lSXM
         nCuXFmtiNSleae2CtFKMqf8/nUj/3J/hWEDI2PqnK1l8TJ25+MF/qQc3JyhL9uNW01u5
         I68M34JvSJIsP11OpymKDTeAAobgBo3tKvYxENduykOW527fvnXj7WKYrnIkbnEfAdYf
         FVJpVRt+kKTGl/J29s1MMqZx6eWgIi7kRoTBZpgW/GqW0AXUqdDqSxGyH0Eh19DuxcxQ
         DB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800227; x=1775405027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        b=gNmWU/ZWN7/bWYqlwghuCZpH8VY2GIw+0fpoM9k9mHgW3du9Datn6VIAl6uFjD3uNy
         8SpSAHqcF9vgHBUGUibkoxhKPCQPHxLg5ee3wIfFDP8bQcs89iaJu00JPGnbquNIxHMV
         aL+QrvvAwm7/9r754NXe9BOMjQnEf5ugniSJG0WqGCHXzHF1C3ITDXLPonxw+7mxPR3Y
         narG25XD/9HT9U+IOzw7g1U8PoJKiub3dN0SVGrf4PMw2waHuzVBd2iASDOJY0a5t2Fe
         Ma+Fp5hlkjXXE0iBOX2Qh1NZ06Tz78WHYzEhzpU3V1FwbfNpobFZFXH6D5hc+z/JTsZo
         uUpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUJVVic8k6PgtM03W7zXYQNUoi46HSbI6Ys54RJWBron5q0Z14mpsyb+Dsak6qyvnP3SpMDLZVmF/Mbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1vT2JN78Jt/216353W8OiQ0yrbE9AHbokCCulbSniLXo5PAW
	RmDZUj9wdZaS7IJF/XJUdDiwfneLjjiUP9Uyx2zrsBFDfk2bmnhhatlKPujgI1yOjXjbfkwDuK4
	bm0aCOLDMFqIKm6yxRKJPNsmunkwhvBM=
X-Gm-Gg: ATEYQzzMoV4MG50ear/O4tvk2yOoeE0/6U0m1v0ACaYV4nmkO0J3Ud2dXitEF3t4aa6
	DCMUNQXns0r61MFJz1gvcK5UnQVKJ9Uq6Tv1wl+7k2Wn3b4aIQYOZxwFXyHnLI9YmX+KB89Nepa
	FdDhzqpzi4hyG/VdFjEg/u5lVD0uxvIx/KRK4DNz7qGcjlFr+u64Ja09ev4UzzyJWZqXnCB++ha
	jR1XdB7Q2xE49iiB032NAeJxSJrz+OIdsi6632ydiLVHQF82PGKcj4hngOfuzRUQ96oDyUCLaT/
	9jzmsDM7
X-Received: by 2002:a05:6808:1a1c:b0:466:ff3a:c745 with SMTP id
 5614622812f47-46a8a3eb1b4mr4305468b6e.21.1774800227277; Sun, 29 Mar 2026
 09:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325040457.2113120-1-jason-jh.lin@mediatek.com> <20260325040457.2113120-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20260325040457.2113120-4-jason-jh.lin@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:03:36 -0500
X-Gm-Features: AQROBzDYnGEvrmF9Nv8aKI46KCu4qNGcGl029nctsf-3ar7uJysAlIX7PTC3c6A
Message-ID: <CABb+yY2cjMskJeXsn8+hZj2DcFs05yabHbSaGT5XSi0fn45zCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
	Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, 
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
	Chen-yu Tsai <wenst@chromium.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57518-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,ndufresne.ca,gmail.com,mediatek.com,chromium.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email,collabora.com:email]
X-Rspamd-Queue-Id: EA5E9352CC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 11:05=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Since the mailbox driver data can be obtained using cmdq_get_mbox_priv()
> and all CMDQ users have transitioned to cmdq_get_mbox_priv(),
> cmdq_get_shift_pa() can be removed.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       |  8 --------
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 12 ------------
>  2 files changed, 20 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index d7c6b38888a3..f463f443e834 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -123,14 +123,6 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, stru=
ct cmdq_mbox_priv *priv)
>  }
>  EXPORT_SYMBOL(cmdq_get_mbox_priv);
>
> -u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> -{
> -       struct cmdq *cmdq =3D container_of(chan->mbox, struct cmdq, mbox)=
;
> -
> -       return cmdq->pdata->shift;
> -}
> -EXPORT_SYMBOL(cmdq_get_shift_pa);
> -
>  static void cmdq_vm_init(struct cmdq *cmdq)
>  {
>         int i;
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mai=
lbox/mtk-cmdq-mailbox.h
> index 07c1bfbdb8c4..a42b44d5fd49 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -96,16 +96,4 @@ struct cmdq_pkt {
>   */
>  void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *p=
riv);
>
> -/**
> - * cmdq_get_shift_pa() - get the shift bits of physical address
> - * @chan: mailbox channel
> - *
> - * GCE can only fetch the command buffer address from a 32-bit register.
> - * Some SOCs support more than 32-bit command buffer address for GCE, wh=
ich
> - * requires some shift bits to make the address fit into the 32-bit regi=
ster.
> - *
> - * Return: the shift bits of physical address
> - */
> -u8 cmdq_get_shift_pa(struct mbox_chan *chan);
> -
>  #endif /* __MTK_CMDQ_MAILBOX_H__ */

I think the simplest would be to take this with the other two
predecessor patches.
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

