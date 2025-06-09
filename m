Return-Path: <linux-media+bounces-34368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A5AD264D
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 21:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEBBA16F554
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 19:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E227821CFF6;
	Mon,  9 Jun 2025 19:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ttJPvL/T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEFC1A8F6D;
	Mon,  9 Jun 2025 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495726; cv=none; b=iAIfGIsJuC/WMbtZkYAzseT8HWYCTBd5/sWNS7dn+3bF0xizsViO94xNTyjYSQb4f+fSqOqTsDMYiCqYOUQ3vi7VkbDc+M3TahwA1ge/sPUrz9uUv7yVe0ic4rYwwX8vV4PrHziWU4F03oBPP7ge6C+Bz63u6pHBGwYFqhcTnl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495726; c=relaxed/simple;
	bh=cJq9sJaaZ0bztQ1yIttQOrB4K6OZFD8rKLGzUKntd2s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lbOq3/IvUEKxpDxQpsBXlqTZLcNMX+j90pgf5IlpOFOHBfZ8+LPiGK0bA+1KcMZ39CdlUa+AdNkIFB9DcViJmuUp5MuNSs3UUQaP/VNQZSqiFwR0yDMDMGKH85u4ckuhJz0vCFc1ZPUx2QjeJ7DGiX/tDvDJxn7g3mlBFUXkFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ttJPvL/T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00E637F0;
	Mon,  9 Jun 2025 21:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749495714;
	bh=cJq9sJaaZ0bztQ1yIttQOrB4K6OZFD8rKLGzUKntd2s=;
	h=From:Subject:Date:To:Cc:From;
	b=ttJPvL/TnZCjXNNdhYoLGXI7za3Grq9FqvtoaqXaBfJHcKdJqlOuhPZEuTyO2dCh9
	 7xDU2wwOS//4Pr/2uCLd+JwRIZbZRnJtX5RFgvxN9xgBUBeYiusDNTKuKBeqRiv/la
	 it2wnHN33etMRA772xnxbrAuJTi+sNXE7Eq0V3SQ=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH 0/3] media: vsp1: Add FCP soft reset procedure
Date: Mon, 09 Jun 2025 21:01:41 +0200
Message-Id: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcvR2gC/0XMOQ6DMBRF0a0g17HkAY9biSg8fCcugMQmCAmx9
 zhQpLxPemdHFUqGimy3owJrrnmeWtBbh8LTTQ/AObZGjDBBJDF4ra8NF6iwYJcSpUIrbkhA7fA
 qkPJ2Yvfh6gLvTzOXa/yTtjtBQRj2/WU2RFPhU5Ix2pWSn+hdBRzmccyL7QTQlBinvTLKJ8Ell
 73UzihFjdOMsQjBGQdoOI4v2ke1a9gAAAA=
X-Change-ID: 20250609-vspx-reset-aff11587390c
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, 
 LUU HOAI <hoai.luu.ub@renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17711;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=cJq9sJaaZ0bztQ1yIttQOrB4K6OZFD8rKLGzUKntd2s=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoRy+n/RUEK8ytCIx7bd6+SW8+ClkXqxUaEpJGW
 qq4sYfb7yqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaEcvpwAKCRByNAaPFqFW
 PAc6EACvBZCZ6/Ec0RdORgpW9ocdOE0XBrtyo81O8RFGsfxdZPQ1wA3x3N1zh50BcZqGptrcroj
 I8UjUYG5NKRXEXXMiB2SXQZohXwwAqXxR5dVmANJB4Gi6N3en0E9wAeTWTyiypqAU28mARyQ6U8
 w+fHfgmaZsddMN8b+BVJ9w92SuuthbNAEtdBhZ3LWOBTp0AQNUqALq5xdws9UdMsIzepsiaoiyw
 rKGqIXdj1t+zyk5KIzpUE5amZTxrND5PcP8Drvb4+mgzzDG/5jIel79t8K3ux387jyblkcoweae
 J4fjHqxNR8gfEmX3u9ae/E4nPr7DlffaVF7SCSGQwXVf0Ai0QbvJhHGodc6CGQDUvzYANs0uoMJ
 n+wGqmvpiA1iTzUvINW7Zj77aXYMYrKnA5nUMecsP3JEpJK1qz9VkZuCjShVIjlvaJOZhUHwutx
 UTRVfeiLyzlmO0NOJeBVMSnjQjjXnWu20KmCl8yvFJZfemtydHU5qAkXx+2CHUnkBntaaOFmDDV
 8PCG6EzA3Ff38lF7O0WVJCP/+SXm+IgONBnA4ncIZWD+H+3uIaO5Oh//c7QceT/HZq8kxveEZ5s
 Cq4WyZEzgs33PXN8E3ghk6wcrHXSEw31LzU7NPobtGtMZxV0msQCzZc7fkwY9jqx4jGRkbovtQn
 qj8FXrwGej0WO8Q==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce the FCP soft reset procedure as documented in section 62.3.7.3
Reset Operation" of R-Car Gen4 Hardware Manual rev 1.21, and use it to
reset FCPD by upporting patch b4bc2410cd81 ("rcar-fcp: Add FCPVD reset
sequence for VSPD") from Renesas R-Car BSP 3.5.3 and apply the same
reset procedure to the FCPX use case when VSPX is in use.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Jacopo Mondi (2):
      media: rcar-fcp: Add rcar_fcp_soft_reset()
      media: vsp1: Reset FCP for VSPX

Koji Matsuoka (1):
      media: vsp1: Reset FCP for VSPD

 drivers/media/platform/renesas/rcar-fcp.c       | 41 +++++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 10 ++++++
 include/media/rcar-fcp.h                        |  5 +++
 3 files changed, 56 insertions(+)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250609-vspx-reset-aff11587390c
prerequisite-change-id: 20250502-b4-vspx-90c815bff6dd:v10
prerequisite-patch-id: 006aa1b677c1aa2060901bf567e918ad19623feb
prerequisite-patch-id: 82e81e0e2189dfe80b936c47ca6d5219009159eb
prerequisite-patch-id: fec031ea0a5bf6fac2ad5d7456916ee222c0159b
prerequisite-patch-id: 793d97c5323f626d056e57b8056cce356dca23e0
prerequisite-patch-id: f8a839ce0f9211f3d851864f863e5a945aeb3148
prerequisite-patch-id: 0bc61abea9cd7772ee62ee7ca82f53e08535f1f2
prerequisite-patch-id: 65f4d6513d2f61d991a6408e29f562ccbfbdc937
prerequisite-patch-id: cb073783f4dc05433707795033d1dae0943699dc
prerequisite-patch-id: a2525b541119c8c301d64943613dbe96c3111793
prerequisite-patch-id: 241a9c7cf735becb760cfe89e13738a8b69a9d7b
prerequisite-patch-id: 5988716576f645e809bb36cb9051e6c71b12796f
prerequisite-patch-id: 5339b193664316461bf691dc5bbbbf9ca94b09fd
prerequisite-patch-id: 07987d6171315719c2aedd20e0a2e843698a46b4
prerequisite-patch-id: 501426a8aa1df9533dafcc8d40ddf4a54c21b0cf
prerequisite-patch-id: 0223b14c20a3ad71af70c6ae1476a09cb23ee1eb
prerequisite-patch-id: 07820589ba04eae01265ac4c0b94131980cd58a0
prerequisite-patch-id: 6de6cac95ffc2c5af734dbea04f49887c3df3b76
prerequisite-patch-id: 215e29dec59fa104193e3fc43b2f759f6cc9f257
prerequisite-patch-id: 620310984096a7953f987fe8cf9131969fc8b4b5
prerequisite-patch-id: 4c350dccfd7d30e347954dedf449481c05a144f5
prerequisite-patch-id: d4f90e88e8fc7b82991f8fd0e715511d4ed0a0fa
prerequisite-patch-id: 76ab4242f8c138ddeb2b0f34b0f957766fe4a65c
prerequisite-patch-id: 13c89aad81ff23d55712e5066519f1c3337cee7d
prerequisite-patch-id: bcc3775da11664978d4c17328ea07218c7b851e1
prerequisite-patch-id: 1e82ab6697def94c15078fbc04b6f8d15a998f7c
prerequisite-patch-id: 3355a329fc00fe136476d7183c3d334164b1ccf7
prerequisite-patch-id: e8d8e394b3572d2dae01a07b14d0b9e397eceedf
prerequisite-patch-id: 525238cdbc880ae67b8301e01302f7232ac4f14a
prerequisite-patch-id: 8a647dbac4a27787fe82ca4d3aa1e4ab21311eb7
prerequisite-patch-id: a0a5a4a72204bbf50cdca71a050e5ba412319002
prerequisite-patch-id: 3b9267e778adf1fab5d202b1dfc5ec529741d9c8
prerequisite-patch-id: 15a4acec434ab84a18e8d8f52896fd9c0ab570bb
prerequisite-patch-id: c2e3e2110c47bc60fa63ca17df9caed40dff6b92
prerequisite-patch-id: e0b3f182322de3adc7707db367c6382e63c317f3
prerequisite-patch-id: 275e6d517cab589d10e1642496c9f856378d1f5f
prerequisite-patch-id: cb1ed04a31a7a715201e799e2c8256a977c661f1
prerequisite-patch-id: 2dd0ca0c58806f4bca1f25cef6b4181ba455a12a
prerequisite-patch-id: 023258a689a5ed293f22504b0390b46cc9ce4bac
prerequisite-patch-id: c6e6e9ff091f36376eb41606ac8bd0d4c01b2e23
prerequisite-patch-id: 740a79bc284ec07de4064a77634c8afd15ef36bd
prerequisite-patch-id: 6cd1027d4c2352dc41ff1c094642911345951171
prerequisite-patch-id: 642e8c01a478a4c0980b0d8a3a05f395e1e62b28
prerequisite-patch-id: 69ddd4750e20892503fe33a1de5a48edae0d3aea
prerequisite-patch-id: a0c59cf60713e023de0100f5a3cbbb54d914b4f3
prerequisite-patch-id: 69ed159afa2c6f6f1f6d53fcf8e470bf18bdcda9
prerequisite-patch-id: 1f7f5da2ba5c8374958f900e83f056a16ac710d8
prerequisite-patch-id: dc53e71afa250af4beb370d662c72df2d5afd12d
prerequisite-patch-id: ef6132a58081462965e73d1edf2b72c2072e6db9
prerequisite-patch-id: 18d9268ec767b3b8130a574aaedf4a88aa0bbc43
prerequisite-patch-id: 2df8bebf689e51ab9bdcc5644233a8da0713c1c8
prerequisite-patch-id: 49683a59b61ee19d2e94812372cf59def36be88c
prerequisite-patch-id: 04175405724364ff8433c9c8b6890758a10f823b
prerequisite-patch-id: c8668e8ab09691247457de971beecd3b9a419268
prerequisite-patch-id: 2ee1645aaa004f8004eb3e1aaf322bb24c67da2a
prerequisite-patch-id: b6bdca719a7b433d0fbcb2febba8e95e85ab961f
prerequisite-patch-id: de08b481be4e88c9776a85309e8f578a358cede3
prerequisite-patch-id: d665f8d46a90a83b27c97e00123f3f2af2bfedcd
prerequisite-patch-id: 6cade6d98fab1ea36ed59fe5502d7d2457180ca5
prerequisite-patch-id: efe8cd505fe17977f00d2c71321f7a3436af735f
prerequisite-patch-id: 1269ba3f7e8ae945d6a4212012a407f289c9071e
prerequisite-patch-id: be93f938d91e66b73a2eeae315229debf5482f4b
prerequisite-patch-id: a4aa6a184c6a21fc4536c11e14d9b5cc61f13346
prerequisite-patch-id: 1b0091875529d392b142814005baa38b2ef77f98
prerequisite-patch-id: 4c960ae93b1e663b11194903ed1810e0ed1e4f59
prerequisite-patch-id: c24967bbdfc7df63d8ecfe70f48e29519692e463
prerequisite-patch-id: 481317ba4b987cbb069c31f3372686a59c0fcb67
prerequisite-patch-id: b3c01a756397745a80032ce0b1c26f27e29f251d
prerequisite-patch-id: 0e9117f08850e38aa7aed402a3791412ac5dc057
prerequisite-patch-id: 157288ae7f6455f43320a4c3d687c5c0f194c847
prerequisite-patch-id: 6fa245ee44399e3009f331dfb329c47f0831339c
prerequisite-patch-id: abbedb85924350a386971df5066146247a9aca0b
prerequisite-patch-id: bdd2e66b951141fa39af04b9c6fa0aa7453e0506
prerequisite-patch-id: 86d613cbea65928f7b1399111a0206d50d31c923
prerequisite-patch-id: b047e11bc2d362ac78eb50ac259e09f98df0fb5b
prerequisite-patch-id: 6b119d5e45df2f4196ebbc43f8642bd108798e12
prerequisite-patch-id: f5d3e1eaff9ccd88d3007361a041d3b6bef2042a
prerequisite-patch-id: 4728e30d9a7cb1ed6983fa0e06681460a78e3b68
prerequisite-patch-id: fe853429a55dcf30e7ffca108c25e19b1684b429
prerequisite-patch-id: de29c213c6980531179c2e0447223b0f73ce85a5
prerequisite-patch-id: ddb0888adce621623ea956b0c2adf91fbb78f34d
prerequisite-patch-id: d933c796825c1224a5673e49fe99290c25fed2e1
prerequisite-patch-id: 2a789a1c35a2d86b6e0f8694b9f39420da9ce7bf
prerequisite-patch-id: bc99ed7ef26cc75f19c3ce0b95171aa23ed9d11f
prerequisite-patch-id: cfdec41d891e15820c722ee12c7cf17f0c7821cd
prerequisite-patch-id: 3b1a6a9601015cebacab120e698428fdc5028ab4
prerequisite-patch-id: 0730d3ff3e306f1636910ddc3e38b13460685aaa
prerequisite-patch-id: ff60c598eaa8f6a29b2c04d71f6cb7218aad82fb
prerequisite-patch-id: bd03e87b41d438a450720b6c763777c4e81581a1
prerequisite-patch-id: cc0e4db331636e2c8595773785a3fdead5c3953e
prerequisite-patch-id: 6418f25a5e02215d9ab3d7b9608d34b2907eadc7
prerequisite-patch-id: 16c2a9bcc773f4c40b2f5ab99783735d31e65275
prerequisite-patch-id: 46888bde4124083d722371169820cfc67e4e93d6
prerequisite-patch-id: 3baf6cff1b5ddd8541af591194330cac8987a834
prerequisite-patch-id: 9920866bab575b64c3c4ff91bbe6eab4e7d7c0c9
prerequisite-patch-id: 590b7bd41a38682fdd17d908dd3c04e0eb61798f
prerequisite-patch-id: 797ee3e4c57416eaa16d75057e86e7d86e37524c
prerequisite-patch-id: c8b132ee26d1defda6fa81935b0daff5b20c52db
prerequisite-patch-id: a852af8bb67913c452ab27bb78b940f6ece5b5b4
prerequisite-patch-id: 7fe82af6cd69ab173b6b76fcf6a61a996d1b9921
prerequisite-patch-id: 958f30e0821bc3ae946764f45a0d20700539c201
prerequisite-patch-id: 537c9698eb6052983e458e527246805fe30fdf4b
prerequisite-patch-id: 99c59213adbedc83093546dfc5700cf9cbb5d79b
prerequisite-patch-id: 784b91b0fc0f59922c10020742535e68781e2f80
prerequisite-patch-id: e6cfef3b2f3fadee1a5b354fe386d173733c1bbe
prerequisite-patch-id: 07935eefdc1e0531cf33df4e02b5557f5f416bc0
prerequisite-patch-id: 6a0f8bc34845350a932195f8dee2bc115776d4bb
prerequisite-patch-id: 0a7e31242d9370797dc71ccb8e0f28e9783e334a
prerequisite-patch-id: 5bf012e07b101a9378c584f4f8ad627eda6d81e4
prerequisite-patch-id: 1c548591f9168a3c1fd0da2e52d5053a98f608e6
prerequisite-patch-id: 17c175859ca5cb9875a9225b02aa84b2b7bda3e0
prerequisite-patch-id: cfc8bb2ac9bac48ae327be2221c58b606fe69dee
prerequisite-patch-id: 1cc425eb2d219a4e704797aa545ad47dc934ea91
prerequisite-patch-id: 4c4bcf216ba7535e683ec84b32cbc731322a6805
prerequisite-patch-id: 4f851f3d3895ebeb385b30084c09c8e37ac90602
prerequisite-patch-id: 94b689c960d1d2a8d1faa188792dba4eba2eaf69
prerequisite-patch-id: d68655aef7ceecf24b2c0cacbd3a4558cb19c12c
prerequisite-patch-id: 87e6ef8bb13f73c2a4715236734d4f1aeb087ccc
prerequisite-patch-id: 9677cdac646ebb9092cb8a3046487648463ce1d9
prerequisite-patch-id: 617f37a5e69f5b4dc18ae784d3b6d45e92934ca1
prerequisite-patch-id: 73f6ac6ca4dba2f77c894f34238901aa22e516f7
prerequisite-patch-id: 131ea4036d3089139e6077bb9d9e5558b8e79720
prerequisite-patch-id: 5a455a3b030a72ad3b5994f3543cb6645463ce68
prerequisite-patch-id: 77049eae2af9e0263bcce9978c54d1d240422e2f
prerequisite-patch-id: ce5c5c111014306f3008f2584edf12742c404c51
prerequisite-patch-id: ceb1b91046feac0f1d178c21833871cac11eaf79
prerequisite-patch-id: cbf2dba607c8ab165c86f1d29a429f2f1034e27b
prerequisite-patch-id: ba983fa966af0f7aea9f850e157c5f2f6ea339ed
prerequisite-patch-id: 6e01c984d74cfebc378b039b2011d008d7a23242
prerequisite-patch-id: e2be3a5e6dcce9379ccb90dd38a092e39266e58b
prerequisite-patch-id: 8ceb4417f41efddaac68dc07b1c6dad647535279
prerequisite-patch-id: 763e2d7d949e2e306f4f671d5d6dba5bbde16173
prerequisite-patch-id: 9d030b75e486859c80d6d0d9140a3d9ee96f72ca
prerequisite-patch-id: 86167cf0a30bb79c8b1a4db03158e3d0c5c49f25
prerequisite-patch-id: d70d0f51b713a78d3e1e6d11d3eab8dcba63638a
prerequisite-patch-id: afffe7096c8e110a8da08c987983bc4441d39578
prerequisite-patch-id: b93c37dc7e09d1631b75387dc1ca90e3066dce17
prerequisite-patch-id: b7b50aa1657be59fd51c3e53d73382a1ee75a08e
prerequisite-patch-id: 30960743105a36f20b3ec4a9ff19e7bca04d6add
prerequisite-patch-id: 2bba98151ca103aa62a513a0fbd0df7ae64d9868
prerequisite-patch-id: 0e43a6d758b5fa5ab921c6aa3c19859e312b47d0
prerequisite-patch-id: 35f8dae1416977e88c2db7c767800c01822e266e
prerequisite-patch-id: e35b05c527217206ae871aef0d7b0261af0319ea
prerequisite-patch-id: 07ba0745c7d72796567e0a57f5c8e5355a8d2046
prerequisite-patch-id: 3398937a7fabb45934bb98a530eef73252231132
prerequisite-patch-id: b21819aa41855942f3474ff8135daccc9c7c652d
prerequisite-patch-id: 0aa1f79c4f7d2658e452a22662063a0c3a133a2d
prerequisite-patch-id: af375b9da2a977ea10d1fee2d500de5a2dbe53dd
prerequisite-patch-id: 9a19af97fdaec6765737712822c43c25aa9c1b6d
prerequisite-patch-id: 22adde125b2830b3a99d869d95383952c1b5dce7
prerequisite-patch-id: 0cdf583824abbd02c476927467e3283cfecf9fdd
prerequisite-patch-id: b780105e1ced1ef3f92792332f9ac7cb388067de
prerequisite-patch-id: 5382f87a64d13bbb99a982f733f7cd272349a34b
prerequisite-patch-id: 700c4bf62e4d8fbd61bf2d7f0289ad6a62ff37d1
prerequisite-patch-id: 4af28f0fe9d553b6834c9340969dc9b1c69ceeb9
prerequisite-patch-id: 1aef52a94a4b67ac092e1d182110cfaad573fec2
prerequisite-patch-id: 02baa8d86d3b6f830fbf80b78931790094d3d647
prerequisite-patch-id: e3d9847d1da4398f1bf0b57f5ef4a612392c7255
prerequisite-patch-id: 54ade6c92a08292f509ad0c42cc578e2b355e699
prerequisite-patch-id: 96df51464b769243d00f11f55721f763b9b0908f
prerequisite-patch-id: 96e1d3ee682a91153ecd32207a641274cdd88b7a
prerequisite-patch-id: 221744f7a7fc757b67c32a1eb2160fb46cd59111
prerequisite-patch-id: 8c3ebcd92a4297b0f28949e6dba038c042f7dfa1
prerequisite-patch-id: 439fe909a37bc235622e8feacc2fc01429dcb4bb
prerequisite-patch-id: 5940443948cee464fb7448778ed180d50736d771
prerequisite-patch-id: eabcbd4bedb2617adf11740c67014de31f99a182
prerequisite-patch-id: ae2fb2c401933d991e9fc4d2eee5a6e1477784c5
prerequisite-patch-id: 2f5fd7b3361480269ca31ca7eb57efd5b0c7d4b6
prerequisite-patch-id: 3265dcfadd7e1c853f6da538acec42e92ac0bf23
prerequisite-patch-id: acefea723793500079d09ec014b306db31f8f312
prerequisite-patch-id: be2103aea6991721b5ac82a9766c6f727c7f19dc
prerequisite-patch-id: eee601000779a2e33df209e3dc4723dc00e9595c
prerequisite-patch-id: ca1bb245ac58404e9416414005573b0f4cf3af66
prerequisite-patch-id: ad8248d441d026a2c2fab1618238a3fbfdb5e2d7
prerequisite-patch-id: 47b4c868fd0d12a7dd2da1666cfde4f947d9a3bf
prerequisite-patch-id: 70d0c27dfc409ee2683272c8b3a8d24e268fcec1
prerequisite-patch-id: f003fb1fa35775b64861f267ce0b4c0a40c36920
prerequisite-patch-id: 6eaee17f664f2e274fe735d5cd2c7e25416e2bca
prerequisite-patch-id: 4fa406d9090b5f2359fa5142b79911f145a09dd8
prerequisite-patch-id: cd8a1246cb4e00c665d294876faee3c7f7858258
prerequisite-patch-id: 86078af5d9a6cb9c0944f7b01ec2f60078c6a60c
prerequisite-patch-id: 3ca11d5e3c01507dc5a3cc0331c97ef97f665b5a
prerequisite-patch-id: 59c1fd8d9b58a2e7708eac72f4e13fb17a8da447
prerequisite-patch-id: 7bd3567abb53e8eceae3a691ece4f0fff16b720a
prerequisite-patch-id: 53d171afd21e89166d1200d74a770bda31bd1aa9
prerequisite-patch-id: c53081b1af3186a0c2486ffa38a99793e04b82c6
prerequisite-patch-id: 4f84b5493c7ce8d7f0f3846f8f0f7e38e26acc5b
prerequisite-patch-id: dbcea678d7d0d82dc170749de24da5c0c08e98c7
prerequisite-patch-id: 32d8523522c70b7a531d1d7207b94a44e57d62e7
prerequisite-patch-id: fac9c6456a1d31e653aa7460d208cf1f3baa9e96
prerequisite-patch-id: 9e0c4bfa2aa68190ef27a91fb92f971737a66929
prerequisite-patch-id: 61ad37caabff3c70ce37bb3f6bc53be263c8b352
prerequisite-patch-id: fe697ef9055b433681e7e728dd7c9df4ed0e3666
prerequisite-patch-id: e9da28c5ec159c6cb81dadc365f6cb2728d1cf7c
prerequisite-patch-id: 3f866727f0f3103868b045e9ddbbc20cfe902aca
prerequisite-patch-id: 2def6b1430c60e07fe2ff4402ba9b13b6bb3856f
prerequisite-patch-id: eaaefa6603d495f9f08164d100223c06538c3832
prerequisite-patch-id: 6329e1a962238d5664caf55c55381cf7633c031b
prerequisite-patch-id: e00330872d4a2dc860a9879e864f5241caa95c40
prerequisite-patch-id: 7af1e8b834cdfdf85b294cc5f5f4d5b7ec2b8b35
prerequisite-patch-id: 5bd3c01799bc81204a95aea1bad38dea8bdeaf6a
prerequisite-patch-id: 1b1e39a4a73c0d0b172bcc5c3803429c2f2645ac
prerequisite-patch-id: 1876aebb318956f46df6196e16b87649f4627579
prerequisite-patch-id: f6a2b54fb29efaef67c2a7feb548265d77b9539d
prerequisite-patch-id: d5295a821cf7ee8fd0143538a9d188d5333060d7
prerequisite-patch-id: 6355915ca56e34834fb704fe2ed113687765c79e
prerequisite-patch-id: 0de38b9f8d34971393653fd05f532fa146074ecf
prerequisite-patch-id: bedce2f1775890b05206148d47551bc824df1bac
prerequisite-patch-id: ea2073b87fcbcca589e8a44415d6f834d2e5850c
prerequisite-patch-id: a015dbed78721ab912b59c70adbe775e8c3c0913
prerequisite-patch-id: cd52d4c5e45b1c7a0166a5531fbfa612b6af7c76
prerequisite-patch-id: bcdcb0e309988412d1bc0abb61672a509eafd5e7
prerequisite-patch-id: d5e9af0a58836fed061e099eb1980f161f64f63e
prerequisite-patch-id: 9c84742a175f0a28276ebae4357a4cbc330e058a
prerequisite-patch-id: e653a01edcedb2438b7d698f9379a380e3e44f67
prerequisite-patch-id: abeed1e23511d2edc6173f8ca0b071eebf99a11d
prerequisite-patch-id: 7e17ea42711fdb7e98b0f2cd157c8cb8e04c7711
prerequisite-patch-id: f3f3e8aabc6e0d3b302667ce667dc454dac63aff
prerequisite-patch-id: 4c717086849565f1672cace071c22da6d69fe397
prerequisite-patch-id: 7070071a6a55346ce2be75d41f7aa32a82045ba9
prerequisite-patch-id: ebe4ed5f5eee01ee38440233e37bff142723852b
prerequisite-patch-id: 628d964cb50e2c27fe245444390aa0dc9c70760d
prerequisite-patch-id: 65246a733cf95a5b2b04caa8dc0adfc1a4652e3d
prerequisite-patch-id: 8f258df4852e26a339c2a401df999c3e96974282
prerequisite-patch-id: a19ce54d0a7e0e2c17cb69d0cc63d27cd5bf5beb
prerequisite-patch-id: 0b8ddee42c28b45d3fee797426f8170130cacad9
prerequisite-patch-id: 6ffc710bba27bb35d37ea6b771ae47b373170c98
prerequisite-patch-id: 5f40376d7762da243b6087a483da53a2165fe5e8
prerequisite-patch-id: 362987e07de6d5fe2f3c4fc22f53b53bc315d82f
prerequisite-patch-id: 51311b8fa3b6e7778f9e1e7f948446c6525c991d
prerequisite-patch-id: 9f266e7190a5ceeb5397ea7428159457247e1227
prerequisite-patch-id: 124453d70e317d66ba7448c3e9935ee72b110bf4
prerequisite-patch-id: af369801e0b1d003ed7dfdf8e9379e85e71acd3d
prerequisite-patch-id: a0103488efadd658389b1bc45142b0291a20a8de
prerequisite-patch-id: 9ebff1e5d12a364d15b9167d15bbb2446ccd0e00
prerequisite-patch-id: 5e36c427b5ae946e16e49a4949f714b7de05def1
prerequisite-patch-id: abc841c80adf6ca65c6b25f53282cb5e3f0cd01d
prerequisite-patch-id: 2b54bd07bf8556512b61787e5b595e80c7e1b314
prerequisite-patch-id: ad9d2a1b6a2173d2aa6188f25c23ec76edbbe6d3
prerequisite-patch-id: 43984f6844978835dd5caaed0c4d994054ffd824
prerequisite-patch-id: 0899603cb8a560d7f1e68bb48cc6441409309fde
prerequisite-patch-id: f3b0a3d36f1442ba08320ed446150236e061bde8
prerequisite-patch-id: 92f0059036f921585b28c46c6321eaa3bc28630a
prerequisite-patch-id: 9389e411dd378b8eb5c20faeb721211a730c16c7
prerequisite-patch-id: d169e7ce815e03e54ba82bcd10264222e32d327a
prerequisite-patch-id: dceb2950ff3b4b01a3d449c62bd161b347a3de41
prerequisite-patch-id: 3cdfb1987443f1b5e82ea79d8e6b0ec4eab4b0e8
prerequisite-patch-id: 6595500c4e8930ca1421eab39ccdffc0f812a221
prerequisite-patch-id: 91bc5c52f2c7d5e4499f894ea5ada00003e5f1be
prerequisite-patch-id: 3fb570fe05892fd4d01593f726492f10751a325c
prerequisite-patch-id: 7ea44dbed04403700e9ac08489b41cd4c8aaf1ec
prerequisite-patch-id: b8646733112c49e3b4cd3fbe56bd0e548babb4cf
prerequisite-patch-id: b2fd317dc16c03ea0dde8f99efcf7ced58b78e9a
prerequisite-patch-id: 40cf12083cfe61e72881092bd6c5cd3b46dc5175
prerequisite-patch-id: 3980791797c53d7335291a770f386e6456dc84d1
prerequisite-patch-id: 7476aa8a403af7859b8e78015c1a8649f2edd5c2
prerequisite-patch-id: 39917f78d26673cb1db01664787f57e83f8bca2f

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


