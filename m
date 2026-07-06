Return-Path: <linux-media+bounces-66761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dGbsGmbCS2o7ZwEAu9opvQ
	(envelope-from <linux-media+bounces-66761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:57:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF3712460
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:57:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gxURCHyC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PSLydRiK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66761-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66761-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 799EB377B3AE
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE13F40A933;
	Mon,  6 Jul 2026 13:16:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F640A94C
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:16:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343818; cv=none; b=mgVepLxIGjElOE1syvJdAIFtnHUKKOT+rJQcB+ySy3spS/ohRucbhswqkHWNMqeJh26oydbakKeX7DdDsk5uBuTa9DZZTFUEqNzoAkYbhozFMf7hzqOznQAV9NM4sbOOq7abTWZGca9ldkb1OAqIIhocFCVb8p9nf62ylv4vcLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343818; c=relaxed/simple;
	bh=osYfKtMdqTMsFlJUTP73i98DkAo9zxWqgwDdKf3SxAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7vE/crp0jXYF4PqKsHL6KOzMDyuQZkJaWue35TqK2DLaW7j/8o7FYeg2xRvn5YVyMN32/AK4/S3EY0lENxlKp/h0029k2Wf9LQHZnBhFl7KCcimiKYksoPVmlfrsq9BW1yefg/occIOXsmFHb7cBCJ+HEhydawH7VCIxcFVe5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxURCHyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSLydRiK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOp8245846
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 13:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vz86zd3go04za6BKCrEOJJ5A
	QbsnL3kIqNm4xRq1ahk=; b=gxURCHyC5Uby2DEF/Sz+/5yNg3sVS5RYamD/XHiq
	Oeg+y1LJwkhEFbOaeUT/NQGKPdVK2zZ8VlG3hv6H4S/me/nezIWTxoEm9In3Bs8g
	ZvdBIq0+/gprmciBEXPztT6Da/pNCqKAPXP77qtywx46VRNq9dIbfHagzvAaAEIl
	E6hG0pwACBSPp2ODRqZ5jgVnHaYTwWXW8Uuan0qZj5WO8InmLPD6We8EBKixryDx
	iPil71OMzHER33szNYpl62CNRKnWkJ2P7UpjNxjXjQ3Ou5rCnNsvVYC1bhpBPa1w
	4pcAqdWpoDmeLyJqbgihNBYMa0DBssjFzMUnNnE2Yj0Udg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gq3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 13:16:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so1998238a91.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343815; x=1783948615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=PSLydRiK2CDkWpT4WyX5bNVjKC0Is9+e0DgSPd47JnLRGDbMCaFeSwtvH6e4S7HXQ4
         L2ctbF95R+K8dxA85tqd2kIkO+vq9dSsx5MkkFH48eGdJH2CYJX4oD6RskkwmTxHmeOL
         BTH/bd8IPVyLaFLlidF8lufbYjdP7IaMSkcUZB4u4tO5ZgJPUjxDtA4HbhNI90523H7B
         YWne1O2XGxsZF9D7FtQHbU0qDGXg6YN3n4h219/POtajnqIeshFrWxMPk/cTZC8chVA3
         x2otchr6MFAblBuP3TbW4YeP6XfWCth5L32Hg7asZ/HXvZCp09pfzPZz5U9cbvBnk5G/
         wIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343815; x=1783948615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=BCQrqdIzOu2kshB122AKbKXoRs0quLjUClHsWjnC8ksq9Yf2YxPsxE9z+/ztzIM6W/
         F8r6yTm5JbHlIAYKshK5G0OLvEKZeBm7BeS0Pw9mWGpLG8raSdyLu/fOWqyD9uLNwfZK
         oeFbwfk3lMyrmC+1vhVbcMGHzXps18ftcy2ckiGkjfAfojGcXB2VtsLHfc8sWaPCKQQQ
         miGx3+UiB2XdQ0hMaPu4/TiwYOj3weOtlpgKaZyesqxepAS3HAJRIu70WG0A+cGnQKv5
         nTxuGNriu3CuECeGpN8kkJ0EA3moQ6jr7jR+a4TwwLhgi5SukTQ/JPTS96JmkbnW2JPQ
         PahQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeB/VTExoBoZyH1DqR9HFkvfh8ZD2qS6w20BWoGVymkyu3bCS3C3fRuECHjzsk3v9OpWgJ//MaWxaMgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf4gEceXJssboUNye/TX/Ftdy9nMdPLje36uEyvUdLXERpnUpC
	OeBwFs+CNpnf+6C51Wm4CFVlI6OjdFgro/1j3cEYQ3heoabpUNpJOEwRZkAXfbNQBNgx36J6L34
	fPhbnzzHoKSRlmc1lI88dTzOmo02z6AurfkZohQCv7FY+lKLbPTwSFs6kD38z09PZ+w==
X-Gm-Gg: AfdE7cm/GoBxyDayyUvPeAluYGp27B47IBR6rkluBLaafW66V9b7Sq2aaAAAEJWCOED
	Y/W14Z/Fys5lsHTbHzGqiStveBC5Xap0ceWTyR2FG7sLV7vXi+OoumBwwBoZQoBO6UDYZfJZ6rv
	e6uPu/AspySYL+zmoChZKZ3nw6btS/WSx7JcuYBpapdweXUSvOiHxtNkUerx7S2H/xSF9rcR9eo
	kdKy2FXYgCV9ywl+55kbDuLGg6h0uDQ1emPtHDD3LCrFjJ7YllOBc0n/b0jVPVs9Rh7a7/u93Xd
	BGD5Q9CO0cy1gGFuTDQ9/VRscKLpKSTqg1r5bHnCCJ5J/9cemYyN4oStPhVweL0c+yMb3LFk0jV
	2ZYPciaLBCoUjnArN9t6MK1n+yGw+Wjqw8rP0JQ==
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376342a91.11.1783343814408;
        Mon, 06 Jul 2026 06:16:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376272a91.11.1783343813871;
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311561dd3a1sm16176449eec.22.2026.07.06.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:46:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and
 convert drivers
Message-ID: <20260706131625.nygqmu2usgifmias@hu-mojha-hyd.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4baac7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1XWaLZrsAAAA:8 a=sOACTKiIrrgCOb8DNPwA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX+NGgq0IktSEi
 HUkeo7Yk74LIWlzDvW7PnXUBxG1OBDk+QPlHm91Gtuyfx07PsDqDP3Ygt4cOFMr17rYKFaiZrXm
 v7Psk4X9Fzq3KlmdEJRyZjpFWqrMxpx4//j1BLlvNdwAs+C/d0DttmLqLB6+XdU7TU8gNr9WEms
 8B6zegQw2DALjspsDPJGegXWVmFwPsMzQSWXJHHUpXGQqRbsq1Qk9yFG7piv4yIEypA7YiD0to1
 GAdoX0qBNogQYgkRQe3IGp6HeHDVlpQ7HxhyEkwcPRQ0zOHfs/WEr7ek3ddPNFyZcsqMN1skFUV
 uXtoA27gwr96t5nE2h+GoIR/0LwAcx8Na1GCOklkFjhUr1JcRjJHM7pWpnhDu+aWMqH4fMjG496
 IdMuKXPBb1/AFqZBPjVNXgLF0NB4GqCh2sVCSkfT+aXZ17A9wQFq9gxwPrl0Grzef8ZL/wO2uqf
 a2Td0La6aNo9zVpIeRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX44ujydDgEUWz
 VAD/CI8KdyVXHbKLGHlEhDPAzAlxT4QkfY9/pVfILGekBpY8trtRAxMkdFk76AcjcjFBJVnv89c
 ghpAhu6XL1zzdVUJbjkoZ+hFbEQKneE=
X-Proofpoint-GUID: O_YHO1pzgGupg0bzLijJbwFH3tjoB-sc
X-Proofpoint-ORIG-GUID: O_YHO1pzgGupg0bzLijJbwFH3tjoB-sc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com,oss.qualcomm.com,bstai.top,linux.dev,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,alsa-project.org];
	TAGGED_FROM(0.00)[bounces-66761-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonath
 anh@nvidia.com,m:srini@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.or
 g,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[92];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8DF3712460

On Mon, Jul 06, 2026 at 01:14:13PM +0100, Mark Brown wrote:
> On Sat, Jul 04, 2026 at 01:08:13AM +0530, Mukesh Ojha wrote:
> > Drivers using of_reserved_mem_device_init() and its variants must
> > manually call of_reserved_mem_device_release() in their remove and
> > error-unwind paths. This is repetitive boilerplate that is easy to
> > get wrong, and several drivers have open-coded the teardown
> > inconsistently or skipped it entirely, leading to dangling reserved
> > memory references.
> 
> Just as a general thing, rather than sending a huge cross subsystem
> series for something like this it's probably better to just send a
> couple of examples, then once the new API is introduced and either has a
> pullable tag or has made it to mainline go and do the conversion.  This
> avoids clogging everyone's inbox with very big serieses.

Apologies for this; this is my first series touching these many
subsystems, and I also learned the hard way when the entire
series was not sent in one shot due to the daily sending limit
via git send-email[1], and I had to cut many cc lists for patches
33/42 to 42/42.

[1]
4.5.3 Your message has too many recipients. For more information regarding
  4.5.3 Google's sending limits, go to
  4.5.3  https://support.google.com/mail/?p=TooManyRecipientsError 5a478bee46e88-30f0bbd2362sm49597158eec.20 - gsmtp


Thanks for the suggestion; point noted.

-- 
-Mukesh Ojha

