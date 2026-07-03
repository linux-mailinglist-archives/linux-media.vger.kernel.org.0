Return-Path: <linux-media+bounces-66550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jAw7K8sSSGrvlwAAu9opvQ
	(envelope-from <linux-media+bounces-66550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 21:51:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6FF7055DE
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 21:51:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VajOTEl2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="e/dPVWcO";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66550-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66550-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2DC430448BA
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 19:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE17342538;
	Fri,  3 Jul 2026 19:49:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3AF329E5A
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 19:49:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108175; cv=none; b=OK8pEoRKSMOUkdQbW9iqg75C+ZOXLCe6zPzCn3rJhYEAckJiM92pvzyJ864CSiCo37yK3A97jFXAqZXSLG6ouhgQ2b7PzowxhgxkIp6RGHeimIAIxszm+5vf+e1U+/gDNlWgsVC4TsaVZLWKBXFrONiAdA59lSSks4vl/RkOuCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108175; c=relaxed/simple;
	bh=eQtv/edX+xJWP4nfWPbGJgulIu/9hpaaWMAhwvHp1dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJ8EBIqlyzOWxqFbslwjhrZB7flMuDfV1y7bmBqBhii+xX5YvKtTQHngbe3cX3dzb+1bLBkqu1fZjgvG+mY5/6JLbVvR4ZRcVuxJK3w8Ge8hIKNGV6f1PPn2Gl/nBowWtSHcKM3+/3eCNt9ZHP/JOXRukHv/pJ73vcJqI541EUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VajOTEl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/dPVWcO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HioZn495393
	for <linux-media@vger.kernel.org>; Fri, 3 Jul 2026 19:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bLJLzW0Ww/O
	JpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=; b=VajOTEl2TqBXAzf2tW1fvyDEAof
	9pqqcBlSU62EYwWLpDFmE6KAFEoz5uiKJuh+GfK7Z/gEmbv6rL7owtce51KVrHWS
	JDymszVAl+JjH8r7PIxzJLHMEkSnc7yjmsPmk7pAahjhtd2M4qefochsF+rT/gVG
	ymuReay3qNZujq/djOXQyHwF++lReEZxvq9V8nIMVjysMUzobb2Tl/pAeuyAvNHP
	OVlKy+p/dk8e+WhhAZf3UxXXfkFHQmzYjl8bGzPEXc6vmdf9bd8GGxa8EwgR3/Sa
	Uj0HGeKXNOzg2T4bRw+GMMXPNRHWYI07wNNJ5EUOGHg+gXB1H0cEWmzY9rQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytmgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 19:49:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso844855a12.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108172; x=1783712972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
        b=e/dPVWcO06ZL7f5J/bhzXMtIwtRm0RTsDG7+sumNEP8DW0dmFiGwnTM5bfzlWxn5hx
         Vlgm4o9DpWLdgm5hU/L6WFaRGGcFpUm6PnMaoEfV0PSNaev4fCciYKlwWbigSZ2sSk7s
         jxQtfN4c77k6GF+i20OSwn4F5esNOHks/+L17bz3DIyOPF3TG3+eVZlqqjL3h+ZQHtUw
         z/uJ8o0ah4rWuaWQ8CNYvco+4RllbgWlGwBCPB7/J624s7WULSfjpVgrz7Bs+TlWE9fh
         c2M5Z471n0/UX5oqf6mN/2yRBGvT6l//qTdi25b9HHwxYHgZ/32Rmm3kOJgJNjczCy13
         nupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108172; x=1783712972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
        b=eX89/Vw0hteGBoGmI+wclPqEZXDUBZlOTuCokIYP0/eYLaCn1j/xF8EUv6jc6gUl3j
         S9I3X8f3EH4fkSupxe7PniH7cizvycw3QaI1GdX8CRF1w7VnWK1AmVJJma3udM/LmwSu
         LsAzzLxftrjxmUTWVBys8pLeJhjMQn7ULvYqIraBXMLLSFVUlsVxhKgNLMa/g9CiFU+v
         BEZ4morf/L0utVZFLSYLiey9F8ZevBLb+KOAaS/CRj+L0kRC1E5c4UJokgt5PtSaxxRw
         3+VlT9bnm9Z2ADwdLSo/GzNDHEQjAff4YjakQV76Ppb87rcEXmYqlexHkEWt/L2PPqsj
         SqlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uIRWMd/KQnSiW7pyBvcOR2nnThTGJ9Uc2DdihgXOnIpN1SRMy+Ef5JNrYO2Di/NCza2yen9pIeTEU2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkq4O3PCURrg530MWwsMiHsYu1eCj5MaYThrwieA5vvmFhv3+t
	0CiAsHSmj5GIDxBqQ6M6Wj4aOE5liL0sAv3Re7hHsbq4VermhXVIE0fdx9NzPIzFg10LQp6Ak7c
	3h9Wn1tbtAv173Z51per+f1J3HblVK2epvTGPbFv8BfvU/edLH2VBwAWvxAYeqeG6ZA==
X-Gm-Gg: AfdE7ckXMgPVfAXzyAWeaGPUFn7SLjLUUBNNMdPAhHRJz0N9xJpiD8cuP6OhNKXiMae
	UUbbx5gfOv+GC2Kk3HQfORp3Gc3fjhmz+mV81ugWybR9evTxhzYaK+XVPu6u7t493lo2nKnDabf
	Ohw1kGXfj2MrvBnpI4yWywOluRjz5u0OP6LUqHZYajnRfw8gKNS8Bl3ij7K+72PBPDF+DJYKQTU
	ftwIhrpUVtLr7tIbQ8C/2DW+EBFaQJWGFS5s6g1Mln8owlrbTUFmb4dbc/Xcf8U2EHNWGMmirVq
	TuZGTSelxx4RauD+9Xn3CyExvJs6sURFifotOcub1PdEROa9x9XlZBUJ2cBpXMkAySH6qYe0sAm
	/upI8pL88w/k6Mi68wyeDYbF2O01u5PxQqU9uTw==
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr761388637.12.1783108171082;
        Fri, 03 Jul 2026 12:49:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr761349637.12.1783108170517;
        Fri, 03 Jul 2026 12:49:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:49:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 25/42] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:38 +0530
Message-ID: <20260703193855.110619-26-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXxnld/KlC+uae
 SL6zGcxefYSGBk/ImlbL0r81b5bf7d2f9Q4bBXh4I10H9cHxEImkGBLHHcuDEZH6L6/6wF+UkHJ
 /X03x/a8FUM5iUh5yJrj2bOsNYKvqW86Z1zTyPfXMdvRGMjo1j0oyX/9Erjh4090E7mL0Xv3NYP
 cdDl4UucD+y/lagOA77sd62dlUR3QIwX1k9sKlGv1DoBJDCn36zktAaWDiuDXHKYWSb5kqPfDeR
 +egMFottPy1j1vgxXyQmV8KGtobMRcHjQhcBCiCqpjtWlu7nIw8jdttA8AlD6y7uBfBmCC1OfIb
 CuBTYg0JjNzCk4KB2iR/HynkQquqhKjjZWFZA9H4YAtuTBckmHCAh3Nom8jYT8bBLh0AYbcMsp/
 EvrnsHpYgPgdc1nxn9k47MHschRKfZ7JfWz5OMFtRL96LuTSdxB7l7VKjaZu0QEZ0Jf4r2R9ht9
 WkEYIjwj+6cZ4MWo08Q==
X-Proofpoint-GUID: VHQgDn3IlqIx8uyNBEvOTkBSjbmd5AYa
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a48124c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Cg4emjn-6EWHYnEhqz4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: VHQgDn3IlqIx8uyNBEvOTkBSjbmd5AYa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXyNPefxzLfGUB
 26NKTjaTsPGvmmQkVseDNiwMo75UyeDuN32JxRQEAsyvMdIjNZp+ZNenmkR4XSJxPfGxt7QKBcr
 EFqRrbNZUp4VUsxWyCecvYjepOrkhGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,bstai.top,gmail.com,pengutronix.de,linux.intel.com,linux.dev,amd.com,cixtech.com,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,collabora.com,alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66550-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:srin
 i@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.or
 g,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_GT_50(0.00)[93];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E6FF7055DE

Replace the hand-rolled devm wrapper (mt8192_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index db0ae44a86af..e4ecd23df180 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,11 +2155,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
-static void mt8192_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2185,14 +2180,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
 	}
 
 	/* init audio related clock */
-- 
2.53.0


