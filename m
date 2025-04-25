Return-Path: <linux-media+bounces-31088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E2A9D5E0
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 00:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FA984A64E9
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 22:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA252957D1;
	Fri, 25 Apr 2025 22:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WdlOBvYI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552A198823
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 22:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745621406; cv=none; b=r3uuxxLOfLHDs+ZL1Yd++gAxuLhXukjNGDvWgFzAwdX5v94l1uD5Xd9OHr0ZUjudAYA3wfTtwK4AJlV6oG4jfNBsDSAOCgGL06zfIrID5CqE5afBI1Md8MGrkJMBVcNoG618+bUtdRNMaEUMEmREq+pbG9PLhm8OWvFJ0v6oc9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745621406; c=relaxed/simple;
	bh=4LnRN0rV81Y9w9s8HkO3B34Xt4WV2J7KEkxCJoitIqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xkw8vEaOZ7iQtIe7c1e07r6vmqd6822VUoZ6rAWQH+X6Jmp/yjLPMCbsQB4seCWZUfDpBNelJTes8YA5MfmY+qC3VDwR1/+xQ7aIwzvezj3Qx3oT3zZfn21pUC+vBBekkSf7rtSOUz2mw1dDo6zRoBhrp0n4n9yzA1GZR5nIQfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WdlOBvYI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3D83605;
	Sat, 26 Apr 2025 00:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745621399;
	bh=4LnRN0rV81Y9w9s8HkO3B34Xt4WV2J7KEkxCJoitIqo=;
	h=From:To:Cc:Subject:Date:From;
	b=WdlOBvYIuR3544J3T+NGI0CVSpZ74YGbzW5SLYirttii26prhn4nIfFKP+Nh0cQ8H
	 0sTlfne4ZCAa5usRz1hSqU598kbA5OYPMJrb7X/fmi2NRAy8/UxUutCRNGsRcvLQ1b
	 3bFMwjEvzsXLuBFqlLuqAf0fTtVH4KwDFqn+3ajo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] media: rkisp1: Clean up error paths of subdev registration
Date: Sat, 26 Apr 2025 01:49:56 +0300
Message-ID: <20250425224956.22231-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI and ISP subdev registration functions have error paths that undo
the initialization and registration operations in case of a failure.
Those paths are not implemented correctly, with gotos jumping to the
wrong label. Setting the subdev v4l2_dev pointer to NULL in the error
path is also unnneeded, as it is never set to a non-NULL value if an
error occurs. Fix those issues.

While at it, use csi->sd.v4l2_dev is a registration check instead of
csi->rkisp1, for consistency with the ISP code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 5 ++---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 841e58c20f7f..b2b962dc4c00 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -460,7 +460,7 @@ int rkisp1_csi_register(struct rkisp1_device *rkisp1)
 
 	ret = media_entity_pads_init(&sd->entity, RKISP1_CSI_PAD_NUM, pads);
 	if (ret)
-		goto err_entity_cleanup;
+		return ret;
 
 	ret = v4l2_subdev_init_finalize(sd);
 	if (ret)
@@ -478,7 +478,6 @@ int rkisp1_csi_register(struct rkisp1_device *rkisp1)
 	v4l2_subdev_cleanup(sd);
 err_entity_cleanup:
 	media_entity_cleanup(&sd->entity);
-	csi->rkisp1 = NULL;
 	return ret;
 }
 
@@ -486,7 +485,7 @@ void rkisp1_csi_unregister(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_csi *csi = &rkisp1->csi;
 
-	if (!csi->rkisp1)
+	if (!csi->sd.v4l2_dev)
 		return;
 
 	v4l2_device_unregister_subdev(&csi->sd);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 468f5a7d03c7..fd2cb6d859e8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -1061,11 +1061,11 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 
 	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
 	if (ret)
-		goto err_entity_cleanup;
+		return ret;
 
 	ret = v4l2_subdev_init_finalize(sd);
 	if (ret)
-		goto err_subdev_cleanup;
+		goto err_entity_cleanup;
 
 	ret = v4l2_device_register_subdev(&rkisp1->v4l2_dev, sd);
 	if (ret) {
@@ -1079,7 +1079,6 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 	v4l2_subdev_cleanup(sd);
 err_entity_cleanup:
 	media_entity_cleanup(&sd->entity);
-	isp->sd.v4l2_dev = NULL;
 	return ret;
 }
 

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 2bf7958ebf563f4534383ac69392eb364a11e870
prerequisite-patch-id: e0d833d62741a12bbc6763949a09a14981f926f9
prerequisite-patch-id: e1fd5b49f16a2a5228709ff13d1d8a075804fbeb
prerequisite-patch-id: cf1b11d219aac7a529582f0937241e0972afea7d
prerequisite-patch-id: 92d55324d4cae865579a60842d3bd46fda6efc84
prerequisite-patch-id: 238dd10dc5d122fd4fb30799d73aa56521a03d48
prerequisite-patch-id: 419c46c65036eb5b7eb724aef0fb21e97a33788c
prerequisite-patch-id: 10e1b41349aef523feab235778380b6bb5cdff7d
prerequisite-patch-id: d6c5baa3d876e1a904fa8e8269525eb059e86d51
prerequisite-patch-id: d7ac4d673370bfcbfed50e71743eef322ef095da
prerequisite-patch-id: 9cc48369edbce443943f44b6d5267067843f8ca5
prerequisite-patch-id: a5b3ad1f2f13f958c9d315d3cbe8c1bf3481129d
prerequisite-patch-id: 8f6cfa3b7637a89a1d1959537199ac53a2eae6b1
prerequisite-patch-id: dd55a263cbac9b09d8540c0b4e2473cd96a2d491
prerequisite-patch-id: 810a7ba7ef81537397a2fc05a4aaeead32f42822
prerequisite-patch-id: c5ab37f18e2dfdfc243f83393bd8c0a19d8dcf3b
prerequisite-patch-id: db702dfb0163973de8727c7f734909ceb610901b
prerequisite-patch-id: b0386b39b6e6d495e9646e602f5383642e6d25f1
prerequisite-patch-id: 40fbb108bf959e2a7fe56f73c43a8854ce8d9333
prerequisite-patch-id: 1688ba660cb2a7a1905195ce3a87de4bff09e8c0
prerequisite-patch-id: e075f9729e010ab0d53b360be3673d0a7f34881b
prerequisite-patch-id: 69888e4bad4c144aed94da28240832d5e7f69996
prerequisite-patch-id: 734ac3a0dbc2ada4c7bd196831eab1c89c401a1a
prerequisite-patch-id: 8f802c0279a0acbb93b1612028c60c12044781e1
prerequisite-patch-id: 1371e70f82d356455d54226c43b33f7ff9815d44
prerequisite-patch-id: 3a551a2d02c79f5af85b5309efaf8bf97b4c01a6
prerequisite-patch-id: c98f8e57b716eb8a85be0a409f77c2f4b7611069
prerequisite-patch-id: 75a9be7b8bbd618fb7cd013a16529c94445a7f1b
prerequisite-patch-id: acd2ddb75bffb2c9c194602f876cec658cad3483
prerequisite-patch-id: 18afca635bc95df3d6900250383b182be60af4fc
prerequisite-patch-id: e9517e78f12182973458b5ecafed826ad8134497
prerequisite-patch-id: 2867407fb3317ca49549e55532bea5ca140434c4
prerequisite-patch-id: 8419d216144e3ee5f86a49b9f5da708fa7e55179
prerequisite-patch-id: ad0c2af976ba3a2ef74f1b56f4deda03b43fa4b2
prerequisite-patch-id: 0507a4876ee1d4960d6235615d39cd71ce9dad2b
prerequisite-patch-id: 5a7cf9c65febc5f55aede3ad7f2f76203e7297be
prerequisite-patch-id: d2588801bf0652b04a8871224453e0640f278b69
prerequisite-patch-id: 52acb3a3b0a4bc0743bd4599d9a5dd73df858a08
prerequisite-patch-id: 2feea13227a68d124f8a1312d2bdf391bb873122
prerequisite-patch-id: 8416726d85eaf1a753680077f2b65642e4856ff4
prerequisite-patch-id: e4744c638e7e03704c968e0f61eb467d062db536
prerequisite-patch-id: e48f154e1d2213ae2b0170f8b5fec9c87bd84098
prerequisite-patch-id: 96dbfde2f31d8d916f357772cdd5e4dea67226b5
prerequisite-patch-id: 16c4da9ba99ba642e9f99f4651ebcc646b309bb3
prerequisite-patch-id: e63cacd7d422bafa24c81c130490531bc1323cf9
prerequisite-patch-id: 56661ea3b3a18de2b12fe79ac86db726b0000338
prerequisite-patch-id: cd960442062676ff351c268176c39795ecbea756
prerequisite-patch-id: be29f6ba9abe1deec24562e016671baa742f198e
prerequisite-patch-id: e2e1cad1639a951b9c55cf580a3418715e0375ac
prerequisite-patch-id: 448203511b129263a08c2e2d8ad426d2d9023944
prerequisite-patch-id: 6939dd38b798663d83dacd2ccf46511656a4f85a
prerequisite-patch-id: e67a7b51b68b87910e9885b903ec23de3c9cdcbe
prerequisite-patch-id: 1a11dfff7e4a794945c154bb18b754fb737dd858
prerequisite-patch-id: 48af6e09d8715683da9abf30bd60f1f2fbe3046b
prerequisite-patch-id: 444df38f62d67a8e83d363bae34f7e09399351df
prerequisite-patch-id: ac243e27489bce67ffef3450a14cf7c0bce431b5
prerequisite-patch-id: 5b8e777b5ae2f015b64c168bbbabf8705dbfe80c
prerequisite-patch-id: bb932390ce4f2be874786d5c39f91a6ce8bf0026
prerequisite-patch-id: ff549f61d4102406ca604ea259f84cd4d7c48543
prerequisite-patch-id: 9077bd06cbc5d3abb1fd19bd3adb936cfddbe1ee
prerequisite-patch-id: 4c93beb0e96bdadc23e884c7ec4e406ef61a6720
prerequisite-patch-id: 6a1906236650de2bb876811e99241e101fb8c6ce
prerequisite-patch-id: 604b526b163f2d92055b2ce31222f23d5a576cd5
prerequisite-patch-id: f64f6c26e8e37ba43f73f537dffa8a3ce585e134
prerequisite-patch-id: c29afd919379230420ab36fd7609259362bf1d46
prerequisite-patch-id: e16923e2d5c2a3e249067871e7b49a7ebf7f20a8
prerequisite-patch-id: c263c45d3c6a031601db663f5f75d4b6d9b1e698
prerequisite-patch-id: 11653e54ac16f76097885313aa72303c4d27e58b
prerequisite-patch-id: 967010f339295f44b72ebb64768ef6b691c0ac4b
prerequisite-patch-id: 36453915c06c4a81740f5ea6028b12482a434626
prerequisite-patch-id: 181ae640a067bf186f124d8d7c45157253ecd750
prerequisite-patch-id: 952c12a3eddaca5d94f40905b5d6bccad1f84719
prerequisite-patch-id: 4489900f9e823cabc3aa57e3be4de9355274d00e
prerequisite-patch-id: 512f35b9733f0d51d1cd69659dd7e090017a945b
prerequisite-patch-id: 95073a5a3a24b0ec00f660209b9fefac818c9a42
prerequisite-patch-id: d9948488b078ecefa56fc5c9d9def705e42815dd
prerequisite-patch-id: 5dd239e9450e730a8d658622d900f91e2ad9b932
prerequisite-patch-id: 31c7bd2caac94ed5dd78c9b494581e31695e4b4d
prerequisite-patch-id: 861704999e05edff31ddb35e49f841136e575a3b
prerequisite-patch-id: 14bd8ae4ce5e52beb1bc16dfdc8812bd22c47453
prerequisite-patch-id: 4be09ffc863ae5b70a845b982b8cbfa32118d855
prerequisite-patch-id: 0045a9fc8a523a2f4395ee5da330b15e13f9867d
prerequisite-patch-id: 03e9216993e44d5d5d0d9aee1ec8a6f00e45c229
prerequisite-patch-id: 73e7a6142af24ec7aabc3e2f4840276b9a810146
prerequisite-patch-id: 437d7ac55c4c7fd35edd58c5e63d14bf6c537e52
prerequisite-patch-id: a33dc532c4cb6653e799fffd18bf7cff80ae7a8b
prerequisite-patch-id: b48a73067df325a8d733acb1d0357ab5f6070e95
prerequisite-patch-id: 72ec1cdccfe0276f65a0cf3a0b650906811efb02
prerequisite-patch-id: 400ee2a085633b7f2d92b54d7640c35e395c7101
prerequisite-patch-id: c1b99ed03285a0c0859c2f4ea99a248e553f86d9
prerequisite-patch-id: 1d118cadb32ac4ab54c94f7bbd478b0e6c70335c
prerequisite-patch-id: 6fe6bdb93e0bed788f4f9ba44b8da5047d949ecf
prerequisite-patch-id: 3e4c48da5fc29bc451f2275538dacf2c811b9640
prerequisite-patch-id: 59999994a435a48ae0661e5265766844390b8728
prerequisite-patch-id: a7b8813c05be15ff007557c0adfeb1774de9a5d5
prerequisite-patch-id: 73a58cc32a2fcc6a661c6bb9003db46c0f7edea8
prerequisite-patch-id: 504d7482fe3b19597ee15c6b6efead0d99efeefc
prerequisite-patch-id: 1bceab85f6dc9617d6a8099198c04d071c01074b
prerequisite-patch-id: af40fd70756e45b7c395db4b99e4126a2736b6b8
prerequisite-patch-id: d70d0f51b713a78d3e1e6d11d3eab8dcba63638a
prerequisite-patch-id: 40bc4919d7f572b52ccab424ac8aedfa8c014662
prerequisite-patch-id: 61c23bec03ed0461bff47ce62bdf1b9c1c922308
prerequisite-patch-id: 0bcbe306206914cc7ee2e43ce5982efee74255fa
prerequisite-patch-id: b3823d37a81e32843d1b6c8fc25dd37a121a445a
prerequisite-patch-id: 8395b9d74503f352b788b106d66bdcea381b1aa6
prerequisite-patch-id: 474035e2a5271a70ff5f53dfd9a43f1f587e7750
prerequisite-patch-id: dddafefc46f50b565959aa7328c000237831e80f
prerequisite-patch-id: 9bea68e49f856009466f85729646e513342b62c9
prerequisite-patch-id: 5c8ecc4f874fbcf40f8cc26c5496bc806306ccdc
prerequisite-patch-id: eb9afb284e86a8692e49a17b92c86c5666f137ad
prerequisite-patch-id: 447b22461d2e3a88c588d0c7718314fce052e278
prerequisite-patch-id: e1fb84a1f9a288377108e0bb9248f6cf8f690248
prerequisite-patch-id: 95455b91d285a1dd4d87efd76162a1ec12e49e21
prerequisite-patch-id: 6864699f8251f426f0bb6434a5f2b4462832a99a
prerequisite-patch-id: 43399c817812dcc2e9b46217614a58e0ca01cc92
prerequisite-patch-id: 8465a369681bd02b0a99919199e74b281c01f2af
prerequisite-patch-id: 9a0005c3aa4a416da981195d6712267099a2c2e4
prerequisite-patch-id: 0f5f0fc99460480fa3b74eaacd50a15df4e439bc
prerequisite-patch-id: b0bd14392d23ce1c29441de7382699ddde55d5ff
prerequisite-patch-id: aae8468a6af75bea7a719fff3ef32e8b2bfe8fe9
prerequisite-patch-id: 24c7da77ce6e793cd3e07706c669123fe1f0b307
prerequisite-patch-id: eb7e2f168e9852b2a7f473660b3398a8dd91ead6
prerequisite-patch-id: 8cc6e19198d0ba83f065f6c92f623858826bc156
prerequisite-patch-id: 793ceb8f2ddb7990bcdb9af1016a02c050ee54ba
prerequisite-patch-id: c12f6e88571e6b2b3b3aca33e652ec725fd61f2f
prerequisite-patch-id: 0d4faf56b6e3b5d8ff824093834645beaaaac59d
prerequisite-patch-id: f2d1e57d5425cca70085f6c166880ac7b3b016a3
prerequisite-patch-id: f638f28066cf1906383a1726e4edac028023b249
prerequisite-patch-id: 34b7d746c4b121960fd1617da4ed21cded03a84f
prerequisite-patch-id: 68fb6ee5da1cd9a0063c73ff8118a2f18c6cab8b
prerequisite-patch-id: c4f40a5d13d97096ad4bfe6af90655bfc941876f
prerequisite-patch-id: 888a8acd1775e90e17bbcbce9b47455a40349226
prerequisite-patch-id: 1d8b5e9486d999a432becb2ef918d3aa7c108e6c
prerequisite-patch-id: d92e1c345053743b5ef86cbf9c10be7721010ae7
prerequisite-patch-id: de0dbed5424be21f5363f7e2cf3d03a3ec01efa7
prerequisite-patch-id: 2cc0cf71ae1177791a04accad2110a1570f9b4db
prerequisite-patch-id: b3a5f79a92f677171349bc2e00b1447a01c614df
-- 
Regards,

Laurent Pinchart


