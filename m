Return-Path: <linux-media+bounces-56745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFdqLYllwWkzSwQAu9opvQ
	(envelope-from <linux-media+bounces-56745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:08:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D652F79C1
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5191930DABA4
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CDB3AEF20;
	Mon, 23 Mar 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EarLjfEg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C4396D16
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276189; cv=pass; b=WXOU+L/SQk3WvUHmX+/C5Jtuq18aPOSIh/NPg8DPhv4es0nURbQVMjlmpftBB5lP/6rQkVe+fqnsvwoB1Sq+J9pzQjab8HbM0vnku2X04pCEzfi7WdHiS221imlfYEHQTl4fDEqCA3dsHI6RU20jXkgf0hfueiVdLThJskK1lLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276189; c=relaxed/simple;
	bh=+on5q4N8SL0w5EOH9rEDfmQSu2nzNibcQeALQEa6kg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8hAxSdvvPQBl81mY6QxwiaOeWPee2e/4ogBaHAooU1xNrvVArAr35sTSwYXLFA9Oq3hxJrA9F0E5bKrUAb+gdr5L6Ws7mEuwYjILJhe0vdw7E8C2obpIfoCFL/rgyoTU8O/4E8kQzlgkFen+oOwDJN+WdtNc7qYcY9/LHQVJJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EarLjfEg; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358bc9c50so39134166b.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774276185; cv=none;
        d=google.com; s=arc-20240605;
        b=LLFItY4pvNlM3tGOsqMJtBxKS3J7qLxZDEhpwavXEG1hsO6ft68MOUY/vT1mOUIesq
         2n7dVtwoUI4DdkOlhs91JZqFLyzKhXDtNrIsjuTPGBrojaGN0wKaFDQdiCc7cx2cclAE
         mZa6EDNOXh1PI2eaURhp4bf6Pm435eg2ApvEEAFvUCkid96lsqWxkDF5p5BJ9oBaQ+Dr
         jf1QU7Z1PsuILn2s4TZ8ofRW9z73tEHtScaybGVnzZ8ox+/KNPHRBCoKrzGmMxeL+/s+
         PcNZs8IGf2pECx5TV4+pzPGHOpx0eWJ8WWyx/JB71OVQen/d4UHrHt+Sn+CR3Hkmq58O
         X0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        fh=z2cvHDnTuzCzb/ekbmMya4xZsDbf5GyjKkvhLPqxnzE=;
        b=gMgR5W5wBO8wUZe+3s07Va3m7TYKZGmWITFHrbBO8jPe29+UJkmbdeMqocYV1Jmj4x
         MbzwiX4jh9n2ZoeRk/4QleSEG/RF0MzVuJaO2U0cpDPVVTPgWOqMNChttznT1WMD8QEr
         vzJMxcQ1yqB2+kkP2MyCoz/igAtv+fMIVSPSwJnR7a3W7/2j5I6bSNB6HmgFqRvMHQjc
         Z/Xe/CTpXcuielPv6MwoI7dE2CxTn8GGiKezqhC59RjITq/0ZhIOzFVaMWYRZIzkmHQu
         zSboDszRXfj910ALZ82JVt9nDQhYe/XoZGo6XzmDpAVbXOfjT+SUHp/U0I0Tpitdck8k
         Vaew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276185; x=1774880985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=EarLjfEgA8q0L+mwlFDSb/Jsya1AqkRGVOEPLdSMAJ77MX5lxnxT+QRFA0oAznGfEF
         2nN+mUJ0plLWWYiAPW/X1kXuZKOVozD0xKj2u2YsNGCv0YXdcpgmH3G00mjovvMWi1u+
         /AxLT5kjY7lPXfaIQ/4EbEPfCluifk1XH3imnJFze0Ftux+Ji82Nxqsb8txMGrYfFaTT
         93M5cbt8/BlNKpA2GbQ09bmrdbHGNBbSE+SKiH5g2ai09kT60GSOlzA7KnUI02sydvxx
         yJ75R0Og09ge7PwUlcRLj5WxOb470X98xhzXrScpCjYJmg7vW8Xl8LaVKgYzEi0ZyGyf
         w/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276185; x=1774880985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=gOe7ch5mAf2SCjlfs0CapqjoBND9imLOixPvGYl8/AudXU1b8zNYj6cJeIOv7dnsMZ
         NcqmBTgM4Ofyidgy5ARZIOgZ72tUXpcwrFLw9qe507A7bagKemP/Wh2x7sxspkwPcvDc
         wc+N60Z5DP7+MODBPxzoXRUCJWWMu6ZQ4XtWg4E0Piv6hE6c2fIjLXeYTrZxe16PTjC6
         UFI6XAGq4Nfu5a5Kw0ZV3xMkXzri/0Uqzdfn0NztDjPwVcOufiwkfy+zDKX89kCXhO3s
         93kckJPigogsvrd0zugT2jYJyKWlZ+tG1c2yIPQ1f82O28vTOTNX+DJG9p6c8ILB6eaY
         RPVg==
X-Forwarded-Encrypted: i=1; AJvYcCXfLvUgjOeXekGq/aSHazOJo5ivr6HheksJAeun4huSqaCoQSzoUnzfPF8LRK4DiBNLT86QAAgbVKDRJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1q/xGJ2Ua5esT2N3qvy+sqtVFxbcDA1FMDVGD3ngYdugIYNLJ
	Kx82O0WERMUTXJWdgzqKxQdVb8BgHUVwgvcw8IJcachtnpcmpkOCU1dhc4c7U8NLQsuhwOZE90v
	mgS6tRyD03CnpUCA/7BfMvox1UoHsbo+eE8IRPrebvA==
X-Gm-Gg: ATEYQzx5Aloxiy0+vMcGYPxYscCL/f/AFvIkg0qVs5CzMNxQ4huFjzSTM8Ge95Xi0ei
	q1GVv3Aa/zyoFG21PAMq3KP3mm4Q7aB5vecaFk3HpEBNs6gt4iw8pl3Ti5Rp9KGc6OHXayTtU4a
	RQ+yNwz8XXHP1MdlY/SgzdxHeAdP3xxvPkr+3uM4No5b1MuyKbLDkfct43hq7EuwLKPGVjW70+P
	WKjVKPtQsIJ/yfpPQXSzjvgw66IgEdZbULotiXnnKqWapS7aoGCeE6WbBN38YbQnQBBu1kBvjei
	+zMaP0N35qm1mrvlbIFn4VGvyBAbYZqclex5k5Ji6w==
X-Received: by 2002:a17:907:a18b:b0:b98:2b20:6680 with SMTP id
 a640c23a62f3a-b982ee95138mr577158566b.0.1774276185012; Mon, 23 Mar 2026
 07:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Mar 2026 08:29:33 -0600
X-Gm-Features: AQROBzDAtL1nQ4PFq47to0a6JE1kiVHOZBw70rBZKtJtzPk95r669W13VmBQzzg
Message-ID: <CANLsYkxVRDd941sVq9rdn_O0eDbDcVctPpKTACVi5vfYhzgYKQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56745-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 51D652F79C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 at 06:37, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> This got acks from Mathieu (remoteproc) and Mark (audio), so can we
> funnel everything via Qualcomm remoteproc tree?
>

I'm good with that.

> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
>
> Changes in v3:
> - Subject fixes (Angelo)
> - Tags
> - Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com
>
> Changes in v2:
> - New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
> - Rebase, add acks.
> - Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com
>
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (5):
>       remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
>       media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
>
>  .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
>  drivers/remoteproc/mtk_scp.c                       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
>  drivers/rpmsg/qcom_smd.c                           | 10 +++++----
>  drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
>  drivers/soc/qcom/apr.c                             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h                 |  2 +-
>  include/linux/rpmsg.h                              | 17 +++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
>  include/linux/soc/qcom/apr.h                       |  4 ++--
>  sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
>  18 files changed, 65 insertions(+), 56 deletions(-)
> ---
> base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

