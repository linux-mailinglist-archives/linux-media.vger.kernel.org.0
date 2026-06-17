Return-Path: <linux-media+bounces-65124-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tqtVM9mmMmrT3AUAu9opvQ
	(envelope-from <linux-media+bounces-65124-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:53:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9669A488
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:53:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=GP5SiRfl;
	dkim=pass header.d=mess.org header.s=2020 header.b=Nyt4nvq2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65124-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65124-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C471A305FB25
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA3F3D5676;
	Wed, 17 Jun 2026 13:51:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB543A8736;
	Wed, 17 Jun 2026 13:51:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704318; cv=none; b=kXlGSGfzgd4GprA/eu3/4tp+hcIAQ4bbM4XqT71s7NRGhyHtDawZsnr1EegR/p0gRsaEcI7FD6d/4OFZCUFzxpD2+FGNhkKYf4jRoMv92O+VdjuULcmpieobqU2SoMlaleIw5jivPPtVpQWAaqLRaakuQ2MX0PQaGGPBhbHJVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704318; c=relaxed/simple;
	bh=zGXNWdS3qEUCqJpA7u+oypnte3YitKm9R7pzOJtxEdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btvtsdJuZ2UqVFLUMxhve5o3LdweXErt1Xx0wwoCNoKf9/vT+pInRgRc2sz3qBYANvQCW8CA3L4OZeemCS65IlEJ3iJyWW2C6PqEbkC3MciU2uGXB0mf9+3wAjjEvKwh3YhvMpitrkNwxGZlUXdFc4odvSULcZ+ywdCF+josOAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=GP5SiRfl; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Nyt4nvq2; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1781704312; bh=zGXNWdS3qEUCqJpA7u+oypnte3YitKm9R7pzOJtxEdM=;
	h=From:To:Cc:Subject:Date:From;
	b=GP5SiRflAvJYwvoWN5o5tjVxQmJMyZYWBtM8K3obwK9/dRiX043L5UjMnUWh08MPO
	 fsNu3oWPRxxffMhzGLGseVNqFNherG53gXYGZ1GkuWNe1ek4TixPex+WVU3VR7A3F4
	 0VYmTJTJwVdT9+FNkAEvrPTFMGZziZwpeQ7KckwjjmHyKcAx5lCRTrrojuiBUIUSdC
	 Z6LfKcKAaV+qMrolMMkQ3m9XJPwJDxrRlkUikCglJVXNjowTN0bA3fujq8h0unosHR
	 T0v5wcCgnvPlYWyEh3CWSQQqCeXvsX+Jsg1akU7GHiBLaWXkMxSeBYIAVfw8ek37m9
	 J4s8IABHX/4GA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 772B94017C; Wed, 17 Jun 2026 14:51:52 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1781704311; bh=zGXNWdS3qEUCqJpA7u+oypnte3YitKm9R7pzOJtxEdM=;
	h=From:To:Cc:Subject:Date:From;
	b=Nyt4nvq2nnMi00q4qAGmSU7tNzw90IqV78M6eJ6zmWuh1yxzltKGZ4iYJmhMJKH5R
	 43dzSRS47sJ3/QQtJhhowHNt0U2UvhSt4Fphj/gjDtPPtNimRz2yUz6Ft2NAAgR6Z7
	 im48KBmIO8uyNXFhZJnEXUAPwvrr8fVypoTkbFbNa55bX4DDBzCuhNgeDDLmX3watf
	 Dwg03Nz58X0KW9vqEzt8WuMUNkHb9HA7oodTst9LZzlR8lxR32TZBFVb4/IWv//1iZ
	 WMlTnlsum8U8JyvB6IOs3KjeJ8OLsaTGlgbVsT7qsBnNT5PN7PexobannxTceiD3mK
	 r9FYootGWCoLA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 8A56540155;
	Wed, 17 Jun 2026 14:51:51 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc-core: Ensure that keymaps are sorted
Date: Wed, 17 Jun 2026 14:51:41 +0100
Message-ID: <20260617135142.1003615-1-sean@mess.org>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65124-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 2AA9669A488

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


