Return-Path: <linux-media+bounces-65537-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 90CHLE7CO2pdcQgAu9opvQ
	(envelope-from <linux-media+bounces-65537-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:41:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4846BDB91
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:41:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=Ms6Go6W+;
	dkim=pass header.d=mess.org header.s=2020 header.b=dVCw7bLu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65537-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65537-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 068C33081EE4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CF839E18E;
	Wed, 24 Jun 2026 11:39:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE2370AED;
	Wed, 24 Jun 2026 11:39:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301190; cv=none; b=XNiR3yjzWdMKQ41bu9AZReJA73cl3G6E0mH8XojSpAfSTUBzmpVqMAK83802FFtoB4UuogxAnxOJSD+i7csK1c3iPppz8A75nWfUkjcii5o6ZmoUHH9BnxaGIKbfoVSI/MCzdV1GxUna3Mr7uHlPUIw762mZBVq/1Ave93QLGjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301190; c=relaxed/simple;
	bh=zGXNWdS3qEUCqJpA7u+oypnte3YitKm9R7pzOJtxEdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ldl2XeG6ml8cDOB0WG/0e2MV+rd86hyO+vXTQ7JeLBqHJCjy6LNXQzVhsrS72xk760mPC+ExeHHJlpXOZ4zZ07SPb6Kbbbt75wg/X0CSYT1jfr8al0hwOvucbZesgCxexg3+EKD2PecOv2BAdb1CQYqr0xVM2N5vO6Ueqb4YgnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Ms6Go6W+; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=dVCw7bLu; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301181; bh=zGXNWdS3qEUCqJpA7u+oypnte3YitKm9R7pzOJtxEdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ms6Go6W+Llabqw/TGC98jQ9969MdZeWd7t7V4iK43Exy5vZg8qoq5kmmaoGR+biwV
	 SEyemgz+2kH+69dHsmea7ozx6QB7UjxqbKkXGFCG3U/Sw77hf/7Fhxd+eT+n3l4ra1
	 wC0FLBmX2fAlMKh1g6wsGZa26AqLjPxzgVfgiPG8b8nLbPUEr8WnN68Vew/sg7Tmgp
	 I9rG0zlOJ1rEjYERnXRetWZRoW5ZTy7yoxd72QgSKeBY8DsLPmA2yMVDgxDTQr7akE
	 9WO4k8v0MucbmRUAtq3Faok55H/YI7S3BO2iVTJKk5274nvwkeNeaO0+pt5LrxcDaC
	 IuCVr00W1y94Q==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 2D61042532; Wed, 24 Jun 2026 12:39:41 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301180; bh=zGXNWdS3qEUCqJpA7u+oypnte3YitKm9R7pzOJtxEdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVCw7bLuloLUkFsniQV//08mPGruZKYzhbWB3XYJoCu9dJNu1ItrXKbR2LcPayPsp
	 Q4E3H4MI6LoTLfOwsnEzr8p2VrxFFf8xT/gl1ShJBzOprL0zdTNtMi0fSragFYb4NW
	 mepfCy+ICuazMjqApZQ01isNhBOrjL8vY5vjqsCEULX/2qN7d0OWFGv/DO8SVJLFFE
	 phkYdpxsvvmsRtwPadpKS8PwphdV81vIhR2tPfJQEV26/8M/rTF4KBt3lcdrcJ4xDv
	 PNN1LAwJGj9ljkYGsX3/Ln5mO/kMzuJWcX6OJonzCCkUA+46Is7RwwWsQv/IFdlLLA
	 VwgwY2q8gct9g==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id E138B42526;
	Wed, 24 Jun 2026 12:39:39 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc-core: Ensure that keymaps are sorted
Date: Wed, 24 Jun 2026 12:39:18 +0100
Message-ID: <20260624113939.111926-1-sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782300922.git.sean@mess.org>
References: <cover.1782300922.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65537-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mess.org:dkim,mess.org:email,mess.org:mid,mess.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B4846BDB91

They are not longer sorted as they should be.

Signed-off-by: Sean Young <sean@mess.org>
---
 include/media/rc-map.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index d90e4611b066..5494f795ea2e 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -215,23 +215,23 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_ASUS_PS3_100              "rc-asus-ps3-100"
 #define RC_MAP_ATI_TV_WONDER_HD_600      "rc-ati-tv-wonder-hd-600"
 #define RC_MAP_ATI_X10                   "rc-ati-x10"
-#define RC_MAP_AVERMEDIA                 "rc-avermedia"
 #define RC_MAP_AVERMEDIA_A16D            "rc-avermedia-a16d"
 #define RC_MAP_AVERMEDIA_CARDBUS         "rc-avermedia-cardbus"
 #define RC_MAP_AVERMEDIA_DVBT            "rc-avermedia-dvbt"
 #define RC_MAP_AVERMEDIA_M135A           "rc-avermedia-m135a"
 #define RC_MAP_AVERMEDIA_M733A_RM_K6     "rc-avermedia-m733a-rm-k6"
+#define RC_MAP_AVERMEDIA                 "rc-avermedia"
 #define RC_MAP_AVERMEDIA_RM_KS           "rc-avermedia-rm-ks"
 #define RC_MAP_AVERTV_303                "rc-avertv-303"
 #define RC_MAP_AZUREWAVE_AD_TU700        "rc-azurewave-ad-tu700"
 #define RC_MAP_BEELINK_GS1               "rc-beelink-gs1"
 #define RC_MAP_BEELINK_MXIII             "rc-beelink-mxiii"
-#define RC_MAP_BEHOLD                    "rc-behold"
 #define RC_MAP_BEHOLD_COLUMBUS           "rc-behold-columbus"
+#define RC_MAP_BEHOLD                    "rc-behold"
 #define RC_MAP_BUDGET_CI_OLD             "rc-budget-ci-old"
 #define RC_MAP_CEC                       "rc-cec"
-#define RC_MAP_CINERGY                   "rc-cinergy"
 #define RC_MAP_CINERGY_1400              "rc-cinergy-1400"
+#define RC_MAP_CINERGY                   "rc-cinergy"
 #define RC_MAP_CT_90405                  "rc-ct-90405"
 #define RC_MAP_D680_DMB                  "rc-d680-dmb"
 #define RC_MAP_DELOCK_61959              "rc-delock-61959"
@@ -240,8 +240,8 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_DIGITALNOW_TINYTWIN       "rc-digitalnow-tinytwin"
 #define RC_MAP_DIGITTRADE                "rc-digittrade"
 #define RC_MAP_DM1105_NEC                "rc-dm1105-nec"
-#define RC_MAP_DNTV_LIVE_DVB_T           "rc-dntv-live-dvb-t"
 #define RC_MAP_DNTV_LIVE_DVBT_PRO        "rc-dntv-live-dvbt-pro"
+#define RC_MAP_DNTV_LIVE_DVB_T           "rc-dntv-live-dvb-t"
 #define RC_MAP_DREAMBOX                  "rc-dreambox"
 #define RC_MAP_DTT200U                   "rc-dtt200u"
 #define RC_MAP_DVBSKY                    "rc-dvbsky"
@@ -249,9 +249,9 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_DVICO_PORTABLE		 "rc-dvico-portable"
 #define RC_MAP_EMPTY                     "rc-empty"
 #define RC_MAP_EM_TERRATEC               "rc-em-terratec"
-#define RC_MAP_ENCORE_ENLTV              "rc-encore-enltv"
 #define RC_MAP_ENCORE_ENLTV2             "rc-encore-enltv2"
 #define RC_MAP_ENCORE_ENLTV_FM53         "rc-encore-enltv-fm53"
+#define RC_MAP_ENCORE_ENLTV              "rc-encore-enltv"
 #define RC_MAP_EVGA_INDTUBE              "rc-evga-indtube"
 #define RC_MAP_EZTV                      "rc-eztv"
 #define RC_MAP_FLYDVB                    "rc-flydvb"
@@ -261,8 +261,8 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_GEEKBOX                   "rc-geekbox"
 #define RC_MAP_GENIUS_TVGO_A11MCE        "rc-genius-tvgo-a11mce"
 #define RC_MAP_GOTVIEW7135               "rc-gotview7135"
-#define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
 #define RC_MAP_HAUPPAUGE_NEW             "rc-hauppauge"
+#define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
 #define RC_MAP_HISI_POPLAR               "rc-hisi-poplar"
 #define RC_MAP_HISI_TV_DEMO              "rc-hisi-tv-demo"
 #define RC_MAP_IMON_MCE                  "rc-imon-mce"
@@ -274,22 +274,23 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_KAIOMY                    "rc-kaiomy"
 #define RC_MAP_KHADAS                    "rc-khadas"
 #define RC_MAP_KHAMSIN                   "rc-khamsin"
+#define RC_MAP_KII_PRO                   "rc-videostrong-kii-pro"
 #define RC_MAP_KWORLD_315U               "rc-kworld-315u"
 #define RC_MAP_KWORLD_PC150U             "rc-kworld-pc150u"
 #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
 #define RC_MAP_LEADTEK_Y04G0051          "rc-leadtek-y04g0051"
 #define RC_MAP_LME2510                   "rc-lme2510"
 #define RC_MAP_MANLI                     "rc-manli"
-#define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
 #define RC_MAP_MECOOL_KIII_PRO           "rc-mecool-kiii-pro"
-#define RC_MAP_MEDION_X10                "rc-medion-x10"
+#define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
 #define RC_MAP_MEDION_X10_DIGITAINER     "rc-medion-x10-digitainer"
 #define RC_MAP_MEDION_X10_OR2X           "rc-medion-x10-or2x"
+#define RC_MAP_MEDION_X10                "rc-medion-x10"
 #define RC_MAP_MINIX_NEO                 "rc-minix-neo"
-#define RC_MAP_MSI_DIGIVOX_II            "rc-msi-digivox-ii"
 #define RC_MAP_MSI_DIGIVOX_III           "rc-msi-digivox-iii"
-#define RC_MAP_MSI_TVANYWHERE            "rc-msi-tvanywhere"
+#define RC_MAP_MSI_DIGIVOX_II            "rc-msi-digivox-ii"
 #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
+#define RC_MAP_MSI_TVANYWHERE            "rc-msi-tvanywhere"
 #define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
 #define RC_MAP_NEBULA                    "rc-nebula"
 #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
@@ -301,10 +302,10 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_PINNACLE_COLOR            "rc-pinnacle-color"
 #define RC_MAP_PINNACLE_GREY             "rc-pinnacle-grey"
 #define RC_MAP_PINNACLE_PCTV_HD          "rc-pinnacle-pctv-hd"
-#define RC_MAP_PIXELVIEW                 "rc-pixelview"
 #define RC_MAP_PIXELVIEW_002T            "rc-pixelview-002t"
 #define RC_MAP_PIXELVIEW_MK12            "rc-pixelview-mk12"
 #define RC_MAP_PIXELVIEW_NEW             "rc-pixelview-new"
+#define RC_MAP_PIXELVIEW                 "rc-pixelview"
 #define RC_MAP_POWERCOLOR_REAL_ANGEL     "rc-powercolor-real-angel"
 #define RC_MAP_PROTEUS_2309              "rc-proteus-2309"
 #define RC_MAP_PURPLETV                  "rc-purpletv"
@@ -325,12 +326,12 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_TERRATEC_CINERGY_C_PCI    "rc-terratec-cinergy-c-pci"
 #define RC_MAP_TERRATEC_CINERGY_S2_HD    "rc-terratec-cinergy-s2-hd"
 #define RC_MAP_TERRATEC_CINERGY_XS       "rc-terratec-cinergy-xs"
-#define RC_MAP_TERRATEC_SLIM             "rc-terratec-slim"
 #define RC_MAP_TERRATEC_SLIM_2           "rc-terratec-slim-2"
+#define RC_MAP_TERRATEC_SLIM             "rc-terratec-slim"
 #define RC_MAP_TEVII_NEC                 "rc-tevii-nec"
 #define RC_MAP_TIVO                      "rc-tivo"
-#define RC_MAP_TOTAL_MEDIA_IN_HAND       "rc-total-media-in-hand"
 #define RC_MAP_TOTAL_MEDIA_IN_HAND_02    "rc-total-media-in-hand-02"
+#define RC_MAP_TOTAL_MEDIA_IN_HAND       "rc-total-media-in-hand"
 #define RC_MAP_TREKSTOR                  "rc-trekstor"
 #define RC_MAP_TT_1500                   "rc-tt-1500"
 #define RC_MAP_TWINHAN_DTV_CAB_CI        "rc-twinhan-dtv-cab-ci"
@@ -339,7 +340,6 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
 #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
-#define RC_MAP_KII_PRO                   "rc-videostrong-kii-pro"
 #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
 #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
 #define RC_MAP_WINFAST                   "rc-winfast"
-- 
2.54.0


