Return-Path: <linux-media+bounces-48920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45014CC44EC
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 17:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7441230636E8
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCB32D8390;
	Tue, 16 Dec 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPk/Qzyk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630F28642B
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 16:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765902456; cv=none; b=egKimbc4qAPf+I0BB4Y6G4rLLUQlWAkt+Y6O4iYXii3wyITITcgMZy48YRFZHGazD3bNevXS6Kn+fvjINeRayd7R1h/OoaJ7xKD9nbrXn98Kfn+LFMUFUfx5cf/+RC/JGFL+UW0dUlGXhmP0yG4doLuZHHo3I7coNaaOY2e1grM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765902456; c=relaxed/simple;
	bh=zspaP2iUmEhFL1NA4vY+gtMBNenFMdoLaeivoKqh6DM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sTvkqfv6+hw8m1mi6h/inan4oh18iIfqyP3NpVcoBz2zcMj6z1IIRwRDON4Zlwbm3SerAqqNOjI6qb4yyaJBj2+GMpOuwn31SiOV/9DIlAfIuI2F3VKbSp5DQm+wVp09EeuTQB7NxGpuHuJk9+P0LEsd2I0lcHAqIwH46nRu11A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPk/Qzyk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f2676bb21so52806465ad.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 08:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765902453; x=1766507253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCIqbYAbB/Llescjij6snm6wGCLpnScQmBXXlsjxQwI=;
        b=nPk/QzykY2wnQWJk7yXJ55abw9/oDkZuovD5ep1WapRc6Wk4lJuAS8A3a2RhQBgVgd
         q5Z7mRS3VwukhZtBXTT96XLrKw44Kfmsmi2cdknXafzeyDUEbVHcWfM5kHwgcgTla4p2
         jbr31w4LpiuOLs6ZcwgnZq97lBAJ4M7S4VrTaVkbNsVfMgtFTgzXpGVhCtcOTD5T1tbd
         Zl/eis6xtt/xYyWh+h1qrx0M+gsGSmB+KmOWXRI5Bh4WIfqwMuk6l2wXrKZc9KrOh/Gv
         +6YLemgbgMLmOf9XHIKZONn9tmQvDEBF+Lm6wLPXOVyObWD1qvgfgwNH5rID4uchobZQ
         61Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765902453; x=1766507253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCIqbYAbB/Llescjij6snm6wGCLpnScQmBXXlsjxQwI=;
        b=q7VoyUIImADP5EPHEvSxauG61mK+GY1t5pnP7k3HBCsVuVLKgW16mZLCzcHGfHPGvw
         cSPpzF/QNYEcB3F65mFod2AIZ5PXYRSh6cCgh402gydAC3EFLM02TSyzwp45pOOitpwN
         qkUuTVsokXAirmfrFVj/iNbexxy29FTqn4arxwtZ3ziJxh0benLeLDrPi7ol6CjntXaH
         94cPkN/knNt9ABwCSDRO/hKvhZAqm+GrjxNd3+bONqLf2fqX2i0Vu967t/rh2UwUEcvM
         om5zs5jrL5P6YOcvPDNvDTBBC624SJ57BaHCANY/B4IZ6RQoQBJqZuvqLr8RYub1w5bf
         S4Tg==
X-Gm-Message-State: AOJu0Yy69QQnj9AXBBheqSgOCgKrwJqzXQRcFnWN81c/qTb+VxQO8+C9
	lWrPXNMpFNOsnHmwuDa6dXI1w6cM7gDwPKEUacwDjM81LXrYjNblD1LlVDMZCJND
X-Gm-Gg: AY/fxX7qq3E7WIbEdflmDjbklfHlnkqkXErO0ZC7kXPVuGfGQnKSQekCqPdNTuh9XGZ
	jDcYyBhm2R5ht7HzRoO4SktElQ22hhUMmlJYolLLsBFX8h0hcKCLmXF6PvTGxGziljI2xu4KUMS
	hl81+xCfxiLHsNZM7TlrKJ4SVHPMGuX54/F5jkMHCbwgUAPXz+Qaq5mwdo8NDk/Nw0SYZ97EFaB
	quGYmIViTnFev7xRTWNJy4JhLyeO9ua6fUYBNeHpZGPqZb+uZ6hMJqKGninRhv/CwavEkj+lJQt
	bZ1CpcA8vrlfwRgcQq8mvdXY04kEPxiLvkB2F8upd/vIYqUdMhUPTryL1mwVxOVc/huQYT4PsWU
	xuC/WIPH4lFbJILKI4JMoDR+yS9Ysk7i1UwoNNDu+5r986bpTEiChpV6M/UY24IAPsPkVwVbDwR
	F/FFbL9ztmBdg+iSXLIr9A1d2wAO45njlOm4Q=
X-Google-Smtp-Source: AGHT+IGAHVVGp31yQM3j1al7+xzIVngkfiJ9N+hcqWImapYT1SrzCUBHlSvTaGnMgofz/0gMBWGJ1w==
X-Received: by 2002:a17:903:b45:b0:2a0:9ca7:7405 with SMTP id d9443c01a7336-2a09ca776f9mr105400205ad.36.1765902452768;
        Tue, 16 Dec 2025 08:27:32 -0800 (PST)
Received: from nikhil-s-Swift-SFG14-73.. ([101.0.62.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0b0a708a6sm92419005ad.97.2025.12.16.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 08:27:32 -0800 (PST)
From: Nikhil S <nikhilsunilkumar@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil S <nikhilsunilkumar@gmail.com>
Subject: [PATCH v2] media: dvb-core: fix style violation issues
Date: Tue, 16 Dec 2025 21:57:06 +0530
Message-ID: <20251216162724.7427-1-nikhilsunilkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple checkpatch-reported style issues.

Changes in v2:
 - Split multiple assignments into separate lines
 - fix reported spacing issues

Signed-off-by: Nikhil S <nikhilsunilkumar@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 183 ++++++++++++++++---------------
 1 file changed, 97 insertions(+), 86 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index 8bb8dd34c223..43cd458cc4a0 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -57,11 +57,12 @@
 #include <media/dvb_demux.h>
 #include <media/dvb_net.h>
 
-static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
+static inline __u32 iov_crc32(__u32 c, struct kvec *iov, unsigned int cnt)
 {
 	unsigned int j;
+
 	for (j = 0; j < cnt; j++)
-		c = crc32_be( c, iov[j].iov_base, iov[j].iov_len );
+		c = crc32_be(c, iov[j].iov_base, iov[j].iov_len);
 	return c;
 }
 
@@ -133,14 +134,14 @@ static __be16 dvb_net_eth_type_trans(struct sk_buff *skb,
 	unsigned char *rawp;
 
 	skb_reset_mac_header(skb);
-	skb_pull(skb,dev->hard_header_len);
+	skb_pull(skb, dev->hard_header_len);
 	eth = eth_hdr(skb);
 
 	if (*eth->h_dest & 1) {
-		if(ether_addr_equal(eth->h_dest,dev->broadcast))
-			skb->pkt_type=PACKET_BROADCAST;
+		if (ether_addr_equal(eth->h_dest, dev->broadcast))
+			skb->pkt_type = PACKET_BROADCAST;
 		else
-			skb->pkt_type=PACKET_MULTICAST;
+			skb->pkt_type = PACKET_MULTICAST;
 	}
 
 	if (ntohs(eth->h_proto) >= ETH_P_802_3_MIN)
@@ -178,20 +179,20 @@ static __be16 dvb_net_eth_type_trans(struct sk_buff *skb,
 
 #define ULE_OPTEXTHDR_PADDING 0
 
-static int ule_test_sndu( struct dvb_net_priv *p )
+static int ule_test_sndu(struct dvb_net_priv *p)
 {
 	return -1;
 }
 
-static int ule_bridged_sndu( struct dvb_net_priv *p )
+static int ule_bridged_sndu(struct dvb_net_priv *p)
 {
-	struct ethhdr *hdr = (struct ethhdr*) p->ule_next_hdr;
-	if(ntohs(hdr->h_proto) < ETH_P_802_3_MIN) {
+	struct ethhdr *hdr = (struct ethhdr *)p->ule_next_hdr;
+
+	if (ntohs(hdr->h_proto) < ETH_P_802_3_MIN) {
 		int framelen = p->ule_sndu_len - ((p->ule_next_hdr+sizeof(struct ethhdr)) - p->ule_skb->data);
 		/* A frame Type < ETH_P_802_3_MIN for a bridged frame, introduces a LLC Length field. */
-		if(framelen != ntohs(hdr->h_proto)) {
+		if (framelen != ntohs(hdr->h_proto))
 			return -1;
-		}
 	}
 	/* Note:
 	 * From RFC4326:
@@ -214,15 +215,15 @@ static int ule_exthdr_padding(struct dvb_net_priv *p)
  *  Returns: >= 0: nr. of bytes consumed by next extension header
  *	     -1:   Mandatory extension header that is not recognized or TEST SNDU; discard.
  */
-static int handle_one_ule_extension( struct dvb_net_priv *p )
+static int handle_one_ule_extension(struct dvb_net_priv *p)
 {
 	/* Table of mandatory extension header handlers.  The header type is the index. */
-	static int (*ule_mandatory_ext_handlers[255])( struct dvb_net_priv *p ) =
-		{ [0] = ule_test_sndu, [1] = ule_bridged_sndu, [2] = NULL,  };
+	static int (*ule_mandatory_ext_handlers[255])(struct dvb_net_priv *p) = {
+			[0] = ule_test_sndu, [1] = ule_bridged_sndu, [2] = NULL,  };
 
 	/* Table of optional extension header handlers.  The header type is the index. */
-	static int (*ule_optional_ext_handlers[255])( struct dvb_net_priv *p ) =
-		{ [0] = ule_exthdr_padding, [1] = NULL, };
+	static int (*ule_optional_ext_handlers[255])(struct dvb_net_priv *p) = {
+			[0] = ule_exthdr_padding, [1] = NULL, };
 
 	int ext_len = 0;
 	unsigned char hlen = (p->ule_sndu_type & 0x0700) >> 8;
@@ -232,8 +233,8 @@ static int handle_one_ule_extension( struct dvb_net_priv *p )
 	if (hlen == 0) {
 		/* Mandatory extension header */
 		if (ule_mandatory_ext_handlers[htype]) {
-			ext_len = ule_mandatory_ext_handlers[htype]( p );
-			if(ext_len >= 0) {
+			ext_len = ule_mandatory_ext_handlers[htype](p);
+			if (ext_len >= 0) {
 				p->ule_next_hdr += ext_len;
 				if (!p->ule_bridged) {
 					p->ule_sndu_type = ntohs(*(__be16 *)p->ule_next_hdr);
@@ -251,9 +252,9 @@ static int handle_one_ule_extension( struct dvb_net_priv *p )
 		ext_len = hlen << 1;
 		/* Process the optional extension header according to its type. */
 		if (ule_optional_ext_handlers[htype])
-			(void)ule_optional_ext_handlers[htype]( p );
+			(void)ule_optional_ext_handlers[htype](p);
 		p->ule_next_hdr += ext_len;
-		p->ule_sndu_type = ntohs( *(__be16 *)(p->ule_next_hdr-2) );
+		p->ule_sndu_type = ntohs(*(__be16 *)(p->ule_next_hdr - 2));
 		/*
 		 * note: the length of the next header type is included in the
 		 * length of THIS optional extension header
@@ -263,13 +264,13 @@ static int handle_one_ule_extension( struct dvb_net_priv *p )
 	return ext_len;
 }
 
-static int handle_ule_extensions( struct dvb_net_priv *p )
+static int handle_ule_extensions(struct dvb_net_priv *p)
 {
 	int total_ext_len = 0, l;
 
 	p->ule_next_hdr = p->ule_skb->data;
 	do {
-		l = handle_one_ule_extension( p );
+		l = handle_one_ule_extension(p);
 		if (l < 0)
 			return l;	/* Stop extension header processing and discard SNDU. */
 		total_ext_len += l;
@@ -284,7 +285,7 @@ static int handle_ule_extensions( struct dvb_net_priv *p )
 
 
 /* Prepare for a new ULE SNDU: reset the decoder state. */
-static inline void reset_ule( struct dvb_net_priv *p )
+static inline void reset_ule(struct dvb_net_priv *p)
 {
 	p->ule_skb = NULL;
 	p->ule_next_hdr = NULL;
@@ -827,6 +828,7 @@ static void dvb_net_ule(struct net_device *dev, const u8 *buf, size_t buf_len)
 				  h.priv->ule_skb->len - 4 }
 			};
 			u32 ule_crc = ~0L, expected_crc;
+
 			if (h.priv->ule_dbit) {
 				/* Set D-bit for CRC32 verification,
 				 * if it was set originally. */
@@ -936,7 +938,8 @@ static void dvb_net_sec(struct net_device *dev,
 	/* we have 14 byte ethernet header (ip header follows);
 	 * 12 byte MPE header; 4 byte checksum; + 2 byte alignment, 8 byte LLC/SNAP
 	 */
-	if (!(skb = dev_alloc_skb(pkt_len - 4 - 12 + 14 + 2 - snap))) {
+	skb = dev_alloc_skb(pkt_len - 4 - 12 + 14 + 2 - snap);
+	if (!skb) {
 		//pr_notice("%s: Memory squeeze, dropping packet.\n", dev->name);
 		stats->rx_dropped++;
 		return;
@@ -949,14 +952,19 @@ static void dvb_net_sec(struct net_device *dev,
 	memcpy(eth + 14, pkt + 12 + snap, pkt_len - 12 - 4 - snap);
 
 	/* create ethernet header: */
-	eth[0]=pkt[0x0b];
-	eth[1]=pkt[0x0a];
-	eth[2]=pkt[0x09];
-	eth[3]=pkt[0x08];
-	eth[4]=pkt[0x04];
-	eth[5]=pkt[0x03];
-
-	eth[6]=eth[7]=eth[8]=eth[9]=eth[10]=eth[11]=0;
+	eth[0] = pkt[0x0b];
+	eth[1] = pkt[0x0a];
+	eth[2] = pkt[0x09];
+	eth[3] = pkt[0x08];
+	eth[4] = pkt[0x04];
+	eth[5] = pkt[0x03];
+
+	eth[6] = 0;
+	eth[7] = 0;
+	eth[8] = 0;
+	eth[9] = 0;
+	eth[10] = 0;
+	eth[11] = 0;
 
 	if (snap) {
 		eth[12] = pkt[18];
@@ -977,7 +985,7 @@ static void dvb_net_sec(struct net_device *dev,
 	skb->protocol = dvb_net_eth_type_trans(skb, dev);
 
 	stats->rx_packets++;
-	stats->rx_bytes+=skb->len;
+	stats->rx_bytes += skb->len;
 	netif_rx(skb);
 }
 
@@ -991,7 +999,7 @@ static int dvb_net_sec_callback(const u8 *buffer1, size_t buffer1_len,
 	 * we rely on the DVB API definition where exactly one complete
 	 * section is delivered in buffer1
 	 */
-	dvb_net_sec (dev, buffer1, buffer1_len);
+	dvb_net_sec(dev, buffer1, buffer1_len);
 	return 0;
 }
 
@@ -1001,10 +1009,10 @@ static netdev_tx_t dvb_net_tx(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 }
 
-static u8 mask_normal[6]={0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
-static u8 mask_allmulti[6]={0xff, 0xff, 0xff, 0x00, 0x00, 0x00};
-static u8 mac_allmulti[6]={0x01, 0x00, 0x5e, 0x00, 0x00, 0x00};
-static u8 mask_promisc[6]={0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+static u8 mask_normal[6] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+static u8 mask_allmulti[6] = {0xff, 0xff, 0xff, 0x00, 0x00, 0x00};
+static u8 mac_allmulti[6] = {0x01, 0x00, 0x5e, 0x00, 0x00, 0x00};
+static u8 mask_promisc[6] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 
 static int dvb_net_filter_sec_set(struct net_device *dev,
 		   struct dmx_section_filter **secfilter,
@@ -1013,26 +1021,26 @@ static int dvb_net_filter_sec_set(struct net_device *dev,
 	struct dvb_net_priv *priv = netdev_priv(dev);
 	int ret;
 
-	*secfilter=NULL;
+	*secfilter = NULL;
 	ret = priv->secfeed->allocate_filter(priv->secfeed, secfilter);
-	if (ret<0) {
+	if (ret < 0) {
 		pr_err("%s: could not get filter\n", dev->name);
 		return ret;
 	}
 
-	(*secfilter)->priv=(void *) dev;
+	(*secfilter)->priv = (void *)dev;
 
 	memset((*secfilter)->filter_value, 0x00, DMX_MAX_FILTER_SIZE);
 	memset((*secfilter)->filter_mask,  0x00, DMX_MAX_FILTER_SIZE);
 	memset((*secfilter)->filter_mode,  0xff, DMX_MAX_FILTER_SIZE);
 
-	(*secfilter)->filter_value[0]=0x3e;
-	(*secfilter)->filter_value[3]=mac[5];
-	(*secfilter)->filter_value[4]=mac[4];
-	(*secfilter)->filter_value[8]=mac[3];
-	(*secfilter)->filter_value[9]=mac[2];
-	(*secfilter)->filter_value[10]=mac[1];
-	(*secfilter)->filter_value[11]=mac[0];
+	(*secfilter)->filter_value[0] = 0x3e;
+	(*secfilter)->filter_value[3] = mac[5];
+	(*secfilter)->filter_value[4] = mac[4];
+	(*secfilter)->filter_value[8] = mac[3];
+	(*secfilter)->filter_value[9] = mac[2];
+	(*secfilter)->filter_value[10] = mac[1];
+	(*secfilter)->filter_value[11] = mac[0];
 
 	(*secfilter)->filter_mask[0] = 0xff;
 	(*secfilter)->filter_mask[3] = mac_mask[5];
@@ -1040,7 +1048,7 @@ static int dvb_net_filter_sec_set(struct net_device *dev,
 	(*secfilter)->filter_mask[8] = mac_mask[3];
 	(*secfilter)->filter_mask[9] = mac_mask[2];
 	(*secfilter)->filter_mask[10] = mac_mask[1];
-	(*secfilter)->filter_mask[11]=mac_mask[0];
+	(*secfilter)->filter_mask[11] = mac_mask[0];
 
 	netdev_dbg(dev, "filter mac=%pM mask=%pM\n", mac, mac_mask);
 
@@ -1059,15 +1067,15 @@ static int dvb_net_feed_start(struct net_device *dev)
 	if (priv->tsfeed || priv->secfeed || priv->secfilter || priv->multi_secfilter[0])
 		pr_err("%s: BUG %d\n", __func__, __LINE__);
 
-	priv->secfeed=NULL;
-	priv->secfilter=NULL;
+	priv->secfeed = NULL;
+	priv->secfilter = NULL;
 	priv->tsfeed = NULL;
 
 	if (priv->feedtype == DVB_NET_FEEDTYPE_MPE) {
 		netdev_dbg(dev, "alloc secfeed\n");
-		ret=demux->allocate_section_feed(demux, &priv->secfeed,
+		ret = demux->allocate_section_feed(demux, &priv->secfeed,
 					 dvb_net_sec_callback);
-		if (ret<0) {
+		if (ret < 0) {
 			pr_err("%s: could not allocate section feed\n",
 			       dev->name);
 			goto error;
@@ -1075,10 +1083,10 @@ static int dvb_net_feed_start(struct net_device *dev)
 
 		ret = priv->secfeed->set(priv->secfeed, priv->pid, 1);
 
-		if (ret<0) {
+		if (ret < 0) {
 			pr_err("%s: could not set section feed\n", dev->name);
 			priv->demux->release_section_feed(priv->demux, priv->secfeed);
-			priv->secfeed=NULL;
+			priv->secfeed = NULL;
 			goto error;
 		}
 
@@ -1096,13 +1104,13 @@ static int dvb_net_feed_start(struct net_device *dev)
 			}
 			break;
 		case RX_MODE_ALL_MULTI:
-			priv->multi_num=1;
+			priv->multi_num = 1;
 			netdev_dbg(dev, "set multi_secfilter[0]\n");
 			dvb_net_filter_sec_set(dev, &priv->multi_secfilter[0],
 					       mac_allmulti, mask_allmulti);
 			break;
 		case RX_MODE_PROMISC:
-			priv->multi_num=0;
+			priv->multi_num = 0;
 			netdev_dbg(dev, "set secfilter\n");
 			dvb_net_filter_sec_set(dev, &priv->secfilter, mac, mask_promisc);
 			break;
@@ -1164,10 +1172,10 @@ static int dvb_net_feed_stop(struct net_device *dev)
 				netdev_dbg(dev, "release secfilter\n");
 				priv->secfeed->release_filter(priv->secfeed,
 							      priv->secfilter);
-				priv->secfilter=NULL;
+				priv->secfilter = NULL;
 			}
 
-			for (i=0; i<priv->multi_num; i++) {
+			for (i = 0; i < priv->multi_num; i++) {
 				if (priv->multi_secfilter[i]) {
 					netdev_dbg(dev, "release multi_filter[%d]\n",
 						   i);
@@ -1189,9 +1197,9 @@ static int dvb_net_feed_stop(struct net_device *dev)
 			}
 			priv->demux->release_ts_feed(priv->demux, priv->tsfeed);
 			priv->tsfeed = NULL;
-		}
-		else
+		} else {
 			pr_err("%s: no ts feed to stop\n", dev->name);
+		}
 	} else
 		ret = -EINVAL;
 	mutex_unlock(&priv->mutex);
@@ -1213,7 +1221,7 @@ static int dvb_set_mc_filter(struct net_device *dev, unsigned char *addr)
 }
 
 
-static void wq_set_multicast_list (struct work_struct *work)
+static void wq_set_multicast_list(struct work_struct *work)
 {
 	struct dvb_net_priv *priv =
 		container_of(work, struct dvb_net_priv, set_multicast_list_wq);
@@ -1247,14 +1255,15 @@ static void wq_set_multicast_list (struct work_struct *work)
 }
 
 
-static void dvb_net_set_multicast_list (struct net_device *dev)
+static void dvb_net_set_multicast_list(struct net_device *dev)
 {
 	struct dvb_net_priv *priv = netdev_priv(dev);
+
 	schedule_work(&priv->set_multicast_list_wq);
 }
 
 
-static void wq_restart_net_feed (struct work_struct *work)
+static void wq_restart_net_feed(struct work_struct *work)
 {
 	struct dvb_net_priv *priv =
 		container_of(work, struct dvb_net_priv, restart_net_feed_wq);
@@ -1267,10 +1276,10 @@ static void wq_restart_net_feed (struct work_struct *work)
 }
 
 
-static int dvb_net_set_mac (struct net_device *dev, void *p)
+static int dvb_net_set_mac(struct net_device *dev, void *p)
 {
 	struct dvb_net_priv *priv = netdev_priv(dev);
-	struct sockaddr *addr=p;
+	struct sockaddr *addr = p;
 
 	eth_hw_addr_set(dev, addr->sa_data);
 
@@ -1330,14 +1339,14 @@ static int get_if(struct dvb_net *dvbnet)
 {
 	int i;
 
-	for (i=0; i<DVB_NET_DEVICES_MAX; i++)
+	for (i = 0; i < DVB_NET_DEVICES_MAX; i++)
 		if (!dvbnet->state[i])
 			break;
 
 	if (i == DVB_NET_DEVICES_MAX)
 		return -1;
 
-	dvbnet->state[i]=1;
+	dvbnet->state[i] = 1;
 	return i;
 }
 
@@ -1350,7 +1359,8 @@ static int dvb_net_add_if(struct dvb_net *dvbnet, u16 pid, u8 feedtype)
 
 	if (feedtype != DVB_NET_FEEDTYPE_MPE && feedtype != DVB_NET_FEEDTYPE_ULE)
 		return -EINVAL;
-	if ((if_num = get_if(dvbnet)) < 0)
+	if_num = get_if(dvbnet);
+	if (if_num < 0)
 		return -EINVAL;
 
 	net = alloc_netdev(sizeof(struct dvb_net_priv), "dvb",
@@ -1387,7 +1397,8 @@ static int dvb_net_add_if(struct dvb_net *dvbnet, u16 pid, u8 feedtype)
 
 	net->base_addr = pid;
 
-	if ((result = register_netdev(net)) < 0) {
+	result = register_netdev(net);
+	if (result < 0) {
 		dvbnet->device[if_num] = NULL;
 		free_netdev(net);
 		return result;
@@ -1413,7 +1424,7 @@ static int dvb_net_remove_if(struct dvb_net *dvbnet, unsigned long num)
 	flush_work(&priv->restart_net_feed_wq);
 	pr_info("removed network interface %s\n", net->name);
 	unregister_netdev(net);
-	dvbnet->state[num]=0;
+	dvbnet->state[num] = 0;
 	dvbnet->device[num] = NULL;
 	free_netdev(net);
 
@@ -1427,7 +1438,7 @@ static int dvb_net_do_ioctl(struct file *file,
 	struct dvb_net *dvbnet = dvbdev->priv;
 	int ret = 0;
 
-	if (((file->f_flags&O_ACCMODE)==O_RDONLY))
+	if (((file->f_flags & O_ACCMODE) == O_RDONLY))
 		return -EPERM;
 
 	if (mutex_lock_interruptible(&dvbnet->ioctl_mutex))
@@ -1449,13 +1460,13 @@ static int dvb_net_do_ioctl(struct file *file,
 			goto ioctl_error;
 		}
 
-		result=dvb_net_add_if(dvbnet, dvbnetif->pid, dvbnetif->feedtype);
-		if (result<0) {
+		result = dvb_net_add_if(dvbnet, dvbnetif->pid, dvbnetif->feedtype);
+		if (result < 0) {
 			module_put(dvbdev->adapter->module);
 			ret = result;
 			goto ioctl_error;
 		}
-		dvbnetif->if_num=result;
+		dvbnetif->if_num = result;
 		break;
 	}
 	case NET_GET_IF:
@@ -1479,8 +1490,8 @@ static int dvb_net_do_ioctl(struct file *file,
 		netdev = dvbnet->device[if_num];
 
 		priv_data = netdev_priv(netdev);
-		dvbnetif->pid=priv_data->pid;
-		dvbnetif->feedtype=priv_data->feedtype;
+		dvbnetif->pid = priv_data->pid;
+		dvbnetif->feedtype = priv_data->feedtype;
 		break;
 	}
 	case NET_REMOVE_IF:
@@ -1515,13 +1526,13 @@ static int dvb_net_do_ioctl(struct file *file,
 			goto ioctl_error;
 		}
 
-		result=dvb_net_add_if(dvbnet, dvbnetif->pid, DVB_NET_FEEDTYPE_MPE);
-		if (result<0) {
+		result = dvb_net_add_if(dvbnet, dvbnetif->pid, DVB_NET_FEEDTYPE_MPE);
+		if (result < 0) {
 			module_put(dvbdev->adapter->module);
 			ret = result;
 			goto ioctl_error;
 		}
-		dvbnetif->if_num=result;
+		dvbnetif->if_num = result;
 		break;
 	}
 	case __NET_GET_IF_OLD:
@@ -1545,7 +1556,7 @@ static int dvb_net_do_ioctl(struct file *file,
 		netdev = dvbnet->device[if_num];
 
 		priv_data = netdev_priv(netdev);
-		dvbnetif->pid=priv_data->pid;
+		dvbnetif->pid = priv_data->pid;
 		break;
 	}
 	default:
@@ -1623,7 +1634,7 @@ static const struct dvb_device dvbdev_net = {
 	.fops = &dvb_net_fops,
 };
 
-void dvb_net_release (struct dvb_net *dvbnet)
+void dvb_net_release(struct dvb_net *dvbnet)
 {
 	int i;
 
@@ -1637,7 +1648,7 @@ void dvb_net_release (struct dvb_net *dvbnet)
 
 	dvb_unregister_device(dvbnet->dvbdev);
 
-	for (i=0; i<DVB_NET_DEVICES_MAX; i++) {
+	for (i = 0; i < DVB_NET_DEVICES_MAX; i++) {
 		if (!dvbnet->state[i])
 			continue;
 		dvb_net_remove_if(dvbnet, i);
@@ -1646,7 +1657,7 @@ void dvb_net_release (struct dvb_net *dvbnet)
 EXPORT_SYMBOL(dvb_net_release);
 
 
-int dvb_net_init (struct dvb_adapter *adap, struct dvb_net *dvbnet,
+int dvb_net_init(struct dvb_adapter *adap, struct dvb_net *dvbnet,
 		  struct dmx_demux *dmx)
 {
 	int i;
@@ -1655,7 +1666,7 @@ int dvb_net_init (struct dvb_adapter *adap, struct dvb_net *dvbnet,
 	mutex_init(&dvbnet->remove_mutex);
 	dvbnet->demux = dmx;
 
-	for (i=0; i<DVB_NET_DEVICES_MAX; i++)
+	for (i = 0; i < DVB_NET_DEVICES_MAX; i++)
 		dvbnet->state[i] = 0;
 
 	return dvb_register_device(adap, &dvbnet->dvbdev, &dvbdev_net,
-- 
2.43.0


