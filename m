Return-Path: <linux-media+bounces-23600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D7F9F4DC4
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9B441892EC5
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966A81F4E3E;
	Tue, 17 Dec 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FbluKOuK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uANGbWrz"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1322AEE0;
	Tue, 17 Dec 2024 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734445880; cv=none; b=bT4eMOJoerYDocfK6yvqp9YdeKIol4u4LLDn3gaBl57BIYm5pXwYUIfDXKa/OyiARHOU/P7lVDqwUI7odrqfodt1U+1+OnbJgfAuXjleq34WeaGi8ggmpBc1gCChLWpUuS+JkWJUvy8S8cyso7CLNYy6TQjVA3CYW/cOpfFP/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734445880; c=relaxed/simple;
	bh=R5AEPOhE5zimeSFXlqP2ApxVlRFcLe3DttjDO3/lbmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGhTlej9ZTJ8skFhd2PTXJN+lyEgN60zG3nIRqDBSm7elp0RKEX9F2UgIUF7Jpe9+7JCLL1wkROUvadJlRILXhywpwmccZyWXrAJ4NFidW0oMjCgiM1viDflT37nl/8VYopWRBjHUGuQHRbQ4M9mHz9AhnRaVJkwyna9cDfdhvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FbluKOuK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uANGbWrz; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 207751140099;
	Tue, 17 Dec 2024 09:31:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 17 Dec 2024 09:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1734445875;
	 x=1734532275; bh=T2z4S2KdGYMfZ5CZdK1KVnHbTmI/csXLkb+hBPu559g=; b=
	FbluKOuKFoFROqVNIowWnfHBIBYNueAei5d3Wo7aUbzKPb+ceZR1yGJjTgZviBnO
	TGeuuzJolBzIuoncn1MP5v2BTJ6U9YGnK07qJa4LbfFLIRwWo5NnYYbsH6mA+pfK
	Z7YdDkkYQBftKu9cCz5fh8UyJnli0y47Ppqq+cJiJ4x3q2X2mZTpIX7ZGlp49+TI
	Jj3uwpCxaEkHU1ZfBfgPxuVdhNL4jMd0BOiOetBJzFBbq+7DhwST0sidUrVElMvV
	H5xMg7cHZTPwhGmVi3spk6vh/GVbwlLlY1XN52jYqE7bnFzRtQN/1LWlPKTiokmD
	VPpTEz46ieDRHAAzfnpDpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734445875; x=
	1734532275; bh=T2z4S2KdGYMfZ5CZdK1KVnHbTmI/csXLkb+hBPu559g=; b=u
	ANGbWrzcLIrsmFkRwsoFzliT4xWjzv0XtPnzbAPeAr6r0Q1byFK++lsdcUsoAJbZ
	6jCPaCp7V9hZJFP0Wnc6CVklvDc0e+Xzkpq6K8cVFokMDfV7RwfFn91iUha1mz/w
	A2WlPQP124IuixqDfUoUilZGGAlK68V1bWYdwnXdmbT8RP5iDK/jUoCtQCyY98RH
	anteWK803a0p/l2Li6GMigvUCpZEraiTFtIYCk3x7aCNYBiyVGhFFlxRLFS7Ugeq
	bqB96Po2OhV1pEWggjYkqW4353wvxxBpWZbP4T4PbUkEP3jEX6w9K6lCiBSAUM8B
	F7fqFV+4AYQRowAv9hnxQ==
X-ME-Sender: <xms:M4thZ54NMKQljdzx_XpTMq8E46_OKgEJROKqYkfezNNtjFxEC2bBdw>
    <xme:M4thZ27cT-6TtqlfAPNht4RkLSnC5_RhlgQklveAk0q6_9Tsp9tS8KB2LDUDcoaYc
    92RoE3z-NabSAe6bNI>
X-ME-Received: <xmr:M4thZwcH1Mgdmij4EDBmnITiGYeqQ9d2GGlb9OE-D8VUJr6Pecig9aSK-SaINiRQ15JBJ0ea8xzfRykEK4WE6S0n5fExadHtSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleehgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedt
    vddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtoheplhgruhhrvghnthhiuhdrphgrlhgtuhesohhs
    shdrnhigphdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugidr
    uggvvhdprhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:M4thZyK07tF8R5Vy4bNCzkbsfDJHrbBAkDbWT0cQo8E2RtPjzkWtCg>
    <xmx:M4thZ9ICFaA2-DmtvM3MF8UlzIjOxvPO_CFoukHSZXRnwjjHzBHSeQ>
    <xmx:M4thZ7x7-T9u_u2kIg3eCwKfJ-Dhn-x7U200xl4sO1GWyJyHqa2V5w>
    <xmx:M4thZ5IoUu4hZEt3lDpXNtEuyg9DIZCYDI2XhNKZhlIC11QZF8h1Gg>
    <xmx:M4thZ0-_vqxqw9whJDPIs3-d3P3YS8yE2YsNBK_sxmnIR63gzxEPQOtT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Dec 2024 09:31:14 -0500 (EST)
Date: Tue, 17 Dec 2024 15:31:12 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] staging: media: max96712: fix kernel oops when
 removing module
Message-ID: <20241217143112.GL878403@ragnatech.se>
References: <20241217065151.1281037-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217065151.1281037-1-laurentiu.palcu@oss.nxp.com>

Hello Laurentiu,

On 2024-12-17 08:51:50 +0200, Laurentiu Palcu wrote:
> The following kernel oops is thrown when trying to remove the max96712
> module:
> 
> Unable to handle kernel paging request at virtual address 00007375746174db
> Mem abort info:
>   ESR = 0x0000000096000004
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x04: level 0 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af89000
> [00007375746174db] pgd=0000000000000000, p4d=0000000000000000
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> Modules linked in: crct10dif_ce polyval_ce mxc_jpeg_encdec flexcan
>     snd_soc_fsl_sai snd_soc_fsl_asoc_card snd_soc_fsl_micfil dwc_mipi_csi2
>     imx_csi_formatter polyval_generic v4l2_jpeg imx_pcm_dma can_dev
>     snd_soc_imx_audmux snd_soc_wm8962 snd_soc_imx_card snd_soc_fsl_utils
>     max96712(C-) rpmsg_ctrl rpmsg_char pwm_fan fuse
>     [last unloaded: imx8_isi]
> CPU: 0 UID: 0 PID: 754 Comm: rmmod
> 	    Tainted: G         C    6.12.0-rc6-06364-g327fec852c31 #17
> Tainted: [C]=CRAP
> Hardware name: NXP i.MX95 19X19 board (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : led_put+0x1c/0x40
> lr : v4l2_subdev_put_privacy_led+0x48/0x58
> sp : ffff80008699bbb0
> x29: ffff80008699bbb0 x28: ffff00008ac233c0 x27: 0000000000000000
> x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> x23: ffff000080cf1170 x22: ffff00008b53bd00 x21: ffff8000822ad1c8
> x20: ffff000080ff5c00 x19: ffff00008b53be40 x18: 0000000000000000
> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> x14: 0000000000000004 x13: ffff0000800f8010 x12: 0000000000000000
> x11: ffff000082acf5c0 x10: ffff000082acf478 x9 : ffff0000800f8010
> x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff6364626d
> x5 : 8080808000000000 x4 : 0000000000000020 x3 : 00000000553a3dc1
> x2 : ffff00008ac233c0 x1 : ffff00008ac233c0 x0 : ff00737574617473
> Call trace:
>  led_put+0x1c/0x40
>  v4l2_subdev_put_privacy_led+0x48/0x58
>  v4l2_async_unregister_subdev+0x2c/0x1a4
>  max96712_remove+0x1c/0x38 [max96712]
>  i2c_device_remove+0x2c/0x9c
>  device_remove+0x4c/0x80
>  device_release_driver_internal+0x1cc/0x228
>  driver_detach+0x4c/0x98
>  bus_remove_driver+0x6c/0xbc
>  driver_unregister+0x30/0x60
>  i2c_del_driver+0x54/0x64
>  max96712_i2c_driver_exit+0x18/0x1d0 [max96712]
>  __arm64_sys_delete_module+0x1a4/0x290
>  invoke_syscall+0x48/0x10c
>  el0_svc_common.constprop.0+0xc0/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x34/0xd8
>  el0t_64_sync_handler+0x120/0x12c
>  el0t_64_sync+0x190/0x194
> Code: f9000bf3 aa0003f3 f9402800 f9402000 (f9403400)
> ---[ end trace 0000000000000000 ]---
> 
> This happens because in v4l2_i2c_subdev_init(), the i2c_set_cliendata()
> is called again and the data is overwritten to point to sd, instead of
> priv. So, in remove(), the wrong pointer is passed to
> v4l2_async_unregister_subdev(), leading to a crash.
> 
> Fixes: 5814f32fef13 ("media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks for catching this.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes in v2:
>  * removed call to i2c_set_clientdata() in probe;
>  * cleaned up the trace in commit message as the tmux status line string
>    sneaked into it;
> 
> Thanks,
> Laurentiu
> 
>  drivers/staging/media/max96712/max96712.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index ede02e8c891cb..0751b2e048958 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -418,7 +418,6 @@ static int max96712_probe(struct i2c_client *client)
>  	priv->info = of_device_get_match_data(&client->dev);
>  
>  	priv->client = client;
> -	i2c_set_clientdata(client, priv);
>  
>  	priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
>  	if (IS_ERR(priv->regmap))
> @@ -448,7 +447,8 @@ static int max96712_probe(struct i2c_client *client)
>  
>  static void max96712_remove(struct i2c_client *client)
>  {
> -	struct max96712_priv *priv = i2c_get_clientdata(client);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
>  
>  	v4l2_async_unregister_subdev(&priv->sd);
>  
> -- 
> 2.44.1
> 

-- 
Kind Regards,
Niklas Söderlund

