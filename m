Return-Path: <linux-media+bounces-66443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D1BLEFGHR2qUaAAAu9opvQ
	(envelope-from <linux-media+bounces-66443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:56:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64C700DD9
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:56:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=hPRHk+ax;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66443-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66443-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 658FA3068997
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFC038AC90;
	Fri,  3 Jul 2026 09:54:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D783D10785;
	Fri,  3 Jul 2026 09:54:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072478; cv=none; b=JkOh2PMTVrr4zeRa3lfEcCPWzcOqkKpnfFLIKTj/UBjNlQbd/LBlFs8NGRpMNc+BoM10PsD29v1m9v02rqGaGStDjOJnva/VAhwyhPywiT1JKB38SR7i6KaTxZVViv297QvrM3+EO74ZmxZTmyHNBwW/bgaml2k8+C3sn7qCxjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072478; c=relaxed/simple;
	bh=aihmdZ3gqYwwU/ZzQTmr2E0hqyqOkLqQwBe4OGpE1/U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aTOwAYU2lSTIRvDS5PCzrgldKifNWhI4koanNF1H3NBeQcrqnPDEVIMKuGZ5+HpVsEaVcuSFY18eQfZUF+NdK9bSOnt/aAVdQyIzuniEzwTFJ3ShRJxmX9itHI3fISq9pUVLHIJSTiS9lRQoeeUGh72/1CPrmuNwIdklGwQ2y9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hPRHk+ax; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7608C212;
	Fri,  3 Jul 2026 11:53:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072426;
	bh=aihmdZ3gqYwwU/ZzQTmr2E0hqyqOkLqQwBe4OGpE1/U=;
	h=From:Subject:Date:To:Cc:From;
	b=hPRHk+axWFZdbrDL4nl7JequNja9p6yiC2BIJVPtADG4Fy9N4Pei2WxuUHbZOnsOS
	 FZK86EU801/wHvi9s3lyW5Kc3Dr2nrGYHJcXRccKe5D8hm2S/f0tbDlSLTNU/MaWqu
	 qy8jPDWn1g1AZJ8n84qwx3Sr+yLslCTYUHp37V90=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH RFC 00/10] media: Support common raw sensor model for Sony
 IMX678
Date: Fri, 03 Jul 2026 15:24:05 +0530
Message-Id: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42QzWrDMBCEX8XoXBn9WH8+FQp5gF5LDitp1YraT
 mPZwRDy7lXdkFuhx9llvhnmSgrOGQvpmyuZ8ZJLPk1V8KeGhA+Y3pHmWDURTGhmmKR53LSxdMQ
 FKIK3SWmv0XhSHV8zprzttDfyenghx9/jjOe1kpf7x0NBGk7jmJe+iUE57BKCi1YmJj1E7WNMM
 oFAJTrHjTGdFT/8EUuBvVLf7IU6ZrmSTrrWaSctp5wW+IQ5t5CHtTwPeVq3Nk8LDm0N/IPhBOO
 K8daZmif+wXgsc0co/thFBQ6ILvAYUn9R5Hi7fQNQrF9OZAEAAA==
X-Change-ID: 20260703-imx678-meta-eab8f56b6e7b
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10510;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=aihmdZ3gqYwwU/ZzQTmr2E0hqyqOkLqQwBe4OGpE1/U=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bJ7Oauhy24itjAf3KWuagewtDEVFZzkKli+
 2WdUPaZ/mOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeGyQAKCRBD3pH5JJpx
 RSGJD/41oRU4KAdUsbcRnw/fKFiReEOGLMifYqeDEJeJ6rKzGETWOTDwZsptQlYjlmQF4G4EAjB
 043FU3m9ZKaNrpVJnbBaOj2hOnoaR8vemt5WpwRKf7cKXq6Mn/DUo7u5GD8NTFiGZfjW7Q3IuYh
 GSLlnm+mizX0w3nKwcLalX2Cu6VkNwbLKUID/V3/VRqbfpsM4ynQ61N3n74rsGtm4wBNlky80Np
 6NS7RdOTamCpDRwq+3w4x82bRqPI1up38Hp+IvM6IChAa/CawRroOpVyAxT+bpQBk6VFg/bKOiJ
 ZBuF7E6vaEuhaYyl2q8fkMYTCit8f+TATsESh4s3SWtNZBuHgpZ+HgWcuJ/TZxHSyp26NjJTtMl
 x6dto6RXpOQDvUkE9j+gxHkreyckXYJ7M4LKHsJ8WonrufD01QddjJYvynlSp38BLkbzX0cAznb
 byctYNM0zUXZHSg6pMjJvwIuH7EEzUDfSlb27+aWyB/sVE/x+vj3qCmILpYDOB1bF0anks3xX7z
 dezTaFVO3DaW1S1vufV1RL8B9S413NPMMQ7wkIF6rp0+8xY19WYDHcMJrOk4x7L4Yzqn60TsL9n
 4V9VcW+bMhcH/yZKR53APcjhyfPXB/X8aPVoSVMSd159dIwXKAQE7MQXGSdq50oiIhjp8lAmehE
 YziRB9kQdIUTGkg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66443-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F64C700DD9

Hi,

This series is marked as RFC to get some early feedback, and serve as
another example, of the new common raw sensor model.

This depends on various series from Sakari, along with the base Sony
IMX678 driver series [1]. You can use my WIP branch for testing this out
[2].

PATCH 1-3: Add internal iamge pad and streams support in the driver
PATCH 4: Support MONO as a CFA pattern in the new V4L2 control for
         generic formats
PATCH 5: Switch to using the common raw sensor model
PATCH 6-7: Add embedded data line using the CSRM
PATCH 8-9: Add support for analogue crop + binning using CSRM
PATCH 10: Add support for RAW10 output

I haven't yet implemented the new FRAME_LENGTH_LINES and
LINE_LENGTH_PIXELS controls as I am waiting for that area of API to
stabilize a bit.

[1]: https://lore.kernel.org/all/20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com/T/#t
[2]: https://github.com/jailuthra/linux/commits/imx678-meta

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (10):
      media: i2c: imx678: Pass v4l2_subdev_client_info
      media: i2c: imx678: Add internal image pad and streams
      media: i2c: imx678: Add .get_frame_desc() hook
      media: uapi: v4l2-ctrls: Add CFA_PATTERN_MONO
      media: i2c: imx678: Use generic raw formats and common raw sensor model
      media: uapi: Add metadata layout for IMX678 embedded line
      media: i2c: imx678: Add embedded data support
      media: i2c: imx678: Add crop selection support
      media: i2c: imx678: Add 2x2 binning support
      media: i2c: imx678: Support 10-bit output

 .../media/v4l/ext-ctrls-image-source.rst           |   3 +
 .../userspace-api/media/v4l/metadata-layouts.rst   |  41 ++
 drivers/media/i2c/imx678.c                         | 638 +++++++++++++++++++--
 include/uapi/linux/v4l2-controls.h                 |   2 +
 4 files changed, 647 insertions(+), 37 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260703-imx678-meta-eab8f56b6e7b
prerequisite-message-id: 20260408153939.969381-1-sakari.ailus@linux.intel.com
prerequisite-patch-id: c030ac5858cff10208a5d4c7bd459aa14e9e3ea6
prerequisite-patch-id: 7f4afcfe65490c8813eba059d79a2cc5db973ef2
prerequisite-patch-id: 9fc6a7095a98d62b47e601c671db9c79aa14d947
prerequisite-patch-id: 698b2b1e8d633198ed013817a687ec58bcea68b7
prerequisite-patch-id: 689a941fb6725daacdf7107ed851f700cfdc7be0
prerequisite-patch-id: 1af601062951ae5346dd0d6c1bd85377dd1db89c
prerequisite-patch-id: 052ab3b49529b4e5db594abfb589621230562133
prerequisite-patch-id: 8b0230cdf83d48cf54efdf48c0e88a4057e0110b
prerequisite-patch-id: 9569d0cc65a9eee9745386d72b0130910a84a9a2
prerequisite-patch-id: 5e8eb2cd3590bbba4f7e8f63c5684fc12c53c849
prerequisite-patch-id: 056a89538e029da0c1d4c24fcd703b3fc2e50e77
prerequisite-patch-id: 4966102cc96c9ba9f011cff5a852149840be39b9
prerequisite-patch-id: 5edfd15750901693bbdc5462dd2dd0c3be0598d5
prerequisite-patch-id: 6cf0af73adb1974c805831b60497ada82baea331
prerequisite-patch-id: 1187f1051e4b77ad77e8ed53defed8a99babc4ef
prerequisite-patch-id: 6bf198fe991c5520b8c65e2c1d587c6d03310972
prerequisite-patch-id: a374921a16083b3eea7afca67e0bbe45f4af4260
prerequisite-patch-id: 8d14dbbb462932abe5243fd83eb47c6460fd4bfa
prerequisite-patch-id: 8f96eb1a157c62d9424c3dcec48d57a53c07abfa
prerequisite-patch-id: e43eff6e18aff5df86339a8245b8972addd12c0e
prerequisite-patch-id: fc8afd56fe97124d0907950e93adb644f8eb4a2d
prerequisite-patch-id: ba839d3d300adaf3d370e7ce5f6b6bd805d4774a
prerequisite-patch-id: 0f58fe5a97d277f6bc2e3d02f87659f2ed1a741e
prerequisite-patch-id: 2963f393b30aa8ce5ed174a76a6d092d89e9f57d
prerequisite-patch-id: 00c83c3d5c94f0d25d55c89d0a4a4d010b40b048
prerequisite-patch-id: 35fae0a419902e999625f085753c3a54d66a5539
prerequisite-patch-id: a23fa2e59b7f32710b965aa4f3a03856393c567f
prerequisite-patch-id: 632a483a7e26d74a296a5502531cf05f419ce906
prerequisite-patch-id: 14b47cb26f0daa46fe64ff5e771fd5858015cd93
prerequisite-message-id: 20260409201501.975242-1-sakari.ailus@linux.intel.com
prerequisite-patch-id: 69b7cf3f01769a6657712fb5ec37ddea7ed5a591
prerequisite-patch-id: 8e97f22171954af575ade9f88be43553fb943e89
prerequisite-patch-id: 4bf4c1a81c0dc26acc3cd6794440be2d5e12b449
prerequisite-patch-id: 47ecdcc55c93ac267682ac00beb231b688490561
prerequisite-patch-id: 78e96b6c792e9b27720505b6f3b2f9f67fdebfcc
prerequisite-patch-id: af87986d5474e906462ab7423c7c7ba01ebcc764
prerequisite-patch-id: 190ea1fc4d225552d174016d49b3c5569fcb5688
prerequisite-patch-id: 803e22cb8b52521012df0bbbb555d0d2128af220
prerequisite-patch-id: a874a1b6edbabdd1e179d9b9d47aeaac1c55e498
prerequisite-patch-id: 0175a5558d73c5b5a2ded9fdf810884d60a624ca
prerequisite-patch-id: 4aa763f3cba2dab2210d727940dc35e8d54c64a5
prerequisite-patch-id: db3c28420095e21f923963f724c45501ed0c20e5
prerequisite-patch-id: 82ece799ce4e3b5e51894bf4c80e6065eaee8ba5
prerequisite-patch-id: 3bdfe5190c0db24e0d35d1d2c1b3f7dc97150ef9
prerequisite-patch-id: 53f3709d4443b34ad05d8a480a763686bbf5b972
prerequisite-patch-id: 82f78f1f9514704919cd886d5e04423c2ab06cd2
prerequisite-patch-id: bee653758d5296e05c7617c93f5c70a9036fde20
prerequisite-patch-id: 5bd63452571645c46b3930b15c525f62773bbc67
prerequisite-patch-id: ba2df8289a8489f0a9cf79b0b1203bbef585d2cd
prerequisite-patch-id: f65dd9667daecbb5189e22544b28e0ae36acffa7
prerequisite-patch-id: 819b5191adb310e958779664f37145fc2c8ca4f8
prerequisite-patch-id: c7c24775321ddd34fc1d85a266a6fef533fe059b
prerequisite-patch-id: 8fa080f854a3850b7e5511134dd0de77adae6bb5
prerequisite-patch-id: e37570c9006747bff2b413f1202a68b98b03e5cd
prerequisite-patch-id: 91a499a1ced922cbffc85cdb8f9d00936d300573
prerequisite-patch-id: 449c1a726ab34bb8d00c7607923ad54dcaa1ec7b
prerequisite-patch-id: 4e706b7f6b671bad02c65569f79036656f533a09
prerequisite-patch-id: ae04ab17c65ad55f684d3e95a76a1b492b8b6a3e
prerequisite-patch-id: d0edb5586044c5e6b3e46a63586118bd5dd559a4
prerequisite-patch-id: 8a208d6314eb17e81cc393990e3ff2a81262038e
prerequisite-patch-id: 723870f084a5f779d1594112b9b40165404e5720
prerequisite-patch-id: 0ebdc9d8d0174ac21f4c58662d04923ff6451572
prerequisite-patch-id: 0f43a6cf0b56864b8b542d2866c0d831493d4a2b
prerequisite-patch-id: 6a56845c8312b74f756e119b0bb153ce167ae63a
prerequisite-patch-id: b4753b223dc9819f26372bb0e6c8aa3cb3c8a730
prerequisite-patch-id: 9481945c4a1a9dc28f482a20398e28c9986c03f7
prerequisite-patch-id: b6c6874433d18d69ccf17e8f3c26ecf0bdf00bd4
prerequisite-patch-id: c6694c823f3e0f994b1ea87c628def23652064e9
prerequisite-patch-id: 8ea0ba238edfe02fe6ee307e60ec066f482dde6c
prerequisite-patch-id: 67447ec40ea19be89b12e7c861a607c3f5fff151
prerequisite-patch-id: 61f2615c2de1e060d78aa84c3dab9e2deb88d463
prerequisite-patch-id: 422fd1be1df4c899ee12fc774e290cee966fc84f
prerequisite-patch-id: e352ab7c7c295a8cd5b93427cfd168fba982ed92
prerequisite-patch-id: cb15a63f60b94102458ad02584fd1e9f98d43c83
prerequisite-patch-id: 425b5752a465b2aa86576197c61c0cda08ac8eca
prerequisite-patch-id: 3bf8b56364f93e435065804004a2119998b71198
prerequisite-patch-id: 91f49884638bbbd26a1df792761c189b0c845594
prerequisite-patch-id: aac31089cb2f7e9ff2a3b72e86b14e56808a455e
prerequisite-patch-id: 8a15da12f4da3a0275c4941aadfa01088c5bd5a7
prerequisite-patch-id: e07d7ca1e622fb7709822eec11bfbd02c89b91fd
prerequisite-patch-id: 509fa19cba15e4481f3917e63284b03175f333a0
prerequisite-patch-id: cec687c5dcfdc8dd4f089bc3ae9ce9c73fc7c72f
prerequisite-patch-id: 26383883e1d1cc483987b988b5892a3398f7abbb
prerequisite-patch-id: 42cdb313dded5c04a5252a2136cc70978167ea81
prerequisite-patch-id: 0279c8fff6112eaeaa9a26b9f1d8d2adc0940e6d
prerequisite-patch-id: 1e9ba3951398c5c5cd9503ef4e10bb5d0f0e1d34
prerequisite-patch-id: 0d2c3117c48af9677ed013e4c30788362eed2cd9
prerequisite-patch-id: 311ae613fd1b27d44c89ddcd8ea38a85676c83f1
prerequisite-patch-id: ec619f1b3dca230745fa2ae8afdfbb91b98895cd
prerequisite-patch-id: 446bc0bbcc7a393f1f61a63511ec93fc87702a74
prerequisite-patch-id: 145e7ddb6e437213ab6dac7d76696189e5747949
prerequisite-patch-id: a838e4d6b00227ee45c4424b8cedea26d6b07f95
prerequisite-patch-id: 3304e98d4f5e7d111c6c8d42072dfff350a0b777
prerequisite-patch-id: 10dfba87125e1c25cca1c8d23bc686b90554577e
prerequisite-patch-id: 250236415a9aee4f77222ad24e522bc4f63a16dc
prerequisite-patch-id: a7e6c7d6002c39a8ca85b77a671a7868b6097a2a
prerequisite-patch-id: 83aae608b61825d932eaed23c86ffb14cbb75179
prerequisite-patch-id: 23a727e001f26066a15667f5c78495934cec2748
prerequisite-patch-id: 21e3a9a0cddc018f43ad4b12c5b4d2b815ddc469
prerequisite-patch-id: 46c32967008274a0833c955b9d318264effb0530
prerequisite-patch-id: aaa32af40827a997e8b4eb9f5768e782dcc540a6
prerequisite-patch-id: 88ccefcf1bb02840f831ee2d9e6a8b6f786ce371
prerequisite-patch-id: 7746f909d6676c24dfab1cacc4bb12734583e15c
prerequisite-patch-id: 6b0c8b2bb7812903195b57de54acb6891f94d798
prerequisite-patch-id: 1b2ac3ece847464ac931f5ff043f61e7d5cff117
prerequisite-patch-id: b9a622d23a29a5628c9660fe098839d9c867f561
prerequisite-patch-id: df325d9f2b49bd5d33358bd332e452cbbaa0377e
prerequisite-patch-id: 1afa63fb51b202c2d06d760effb7527f6a6d9aef
prerequisite-patch-id: 938e4cf2e19592e58a9c119a1aa7f625028bfa06
prerequisite-patch-id: 1a9a3c2242036074de6af65359f5a83cafc59199
prerequisite-patch-id: ea9d5f3e3655970efb586f7bf31b749fd6451eb6
prerequisite-patch-id: 3e8a3ed13ab2e0674783fe1c0a0ebc8c517835a5
prerequisite-patch-id: ed3b61d2c9b0d683d11e81afb4f10da91e6d999a
prerequisite-patch-id: 791ec7ac32ede52e02feb9022985be77a11cce5e
prerequisite-patch-id: dc1a5c536b251fd2b51a5bbe90b1d8787c0f430e
prerequisite-patch-id: 6a9109ab0efe5b971101008ec68411c1a72203cd
prerequisite-change-id: 20260513-imx678-5c1aee9c1dcf:v5
prerequisite-patch-id: a40f92053b5ba627c590cea15b2a40ec938c2616
prerequisite-patch-id: e82f68778f6908e247043ee6ffd537b98545cca8
prerequisite-patch-id: 36be50c441e57b93c09a6c2b87476f0897b9426d
prerequisite-patch-id: e4724a4c34661bb2bad2f87d99967bd25bdeb289
prerequisite-patch-id: c7222a23e6ab9e723657570cd5b8fdb11165c602
prerequisite-patch-id: 73ad42b57f89c4e3076c66f03bddbbfd93b87521
prerequisite-patch-id: ad131ff5b4b018cc43e4b84aaa737cda40f414b8
prerequisite-patch-id: 596fdec18c0b8c179f3df6acff1270529dc98533
prerequisite-patch-id: 7a0e10de1c812d1a19a6b31c07680f954ad3c9cb
prerequisite-patch-id: 8831de10a971d46ce7e5dc9bf6c5460a6f8db1ab
prerequisite-patch-id: 8fcdc08cdfe76e13a871de96c2675aa12b578773

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


