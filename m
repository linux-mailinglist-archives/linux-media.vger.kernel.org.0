Return-Path: <linux-media+bounces-49082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44ECCD29F
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 19:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C79F3055F81
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 18:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781193161BB;
	Thu, 18 Dec 2025 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HohxgcjG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607E308F3D
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766082456; cv=none; b=PHpFqo9D8awWEzOEHvgQjPmk5iKi9oFfPiz/Qpm7pk2fm5YKSEE4Lr4xZMTjmUySDkqaf9OfeUOp2yMwJe/NMKAB3SOd900NvQoPdUmuwphVAR0h/JhQvMauU2GEIsGBk6H8NhHwXGCLiA2x3Po6qG+kibP1pyeHkTt9VJF8V2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766082456; c=relaxed/simple;
	bh=RKuAD5Ej2hjctvOa0vN5aYt/9+GveUnSajQfjX2p8bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b41n2/O3nitrW/73qTPBMDj7fh1St9JGDpTM4PCiqmTKwoM18lLMWGa+InZJzl0zMHqkDbjnsrmRd+WT2je0YxT3lm+L3WMKQR5b216M0zKGKfpZ3FioNnxZr4WpZRKwtWZt/VS5V2T1mZu9lTCaUY3biTSZCZcdNr17kGYwPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HohxgcjG; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso1169142b3a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766082450; x=1766687250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRjpCUtnbusXgG6JBr0HADx1jpxK5F7U+ncvwUgGUnw=;
        b=HohxgcjGx4PqWbhheYdQpnj1cRpg+VunPvyNe/asOQYgu4uX5b0IyxPnM9r587ICzF
         tCgZqXxFAFjeYOTRmQQusjMZxbMmbwRE240qClXmUmo33oq9LaGURZrb/9BNwb0eaLwp
         G9Yw5gqjRxLkwIS2eRWaEcU2wvS87ZkL5cjUOo4iFtfHkRYfjEET1FNY783XtWq5G8Xd
         4XIWRusPDvG8X6Fp+Eq8yMc5aOaUVARTIbz82ODcR1tjsPJ2bSF/suZbiz5SevKW4N8l
         jOQ9e3J2YvkL6yYeWQhs8LSzLC5tbIGR0FmwpBlGTFXLWYgrJ3vee5ag4CJztrg7qNqQ
         Zabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766082450; x=1766687250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRjpCUtnbusXgG6JBr0HADx1jpxK5F7U+ncvwUgGUnw=;
        b=qYArDh/3kXyz5o7y3uOwZgYg2yp+cy3D83L8eMTVo7Pq6I24FvNCZoIyvSPhcKyFiU
         I5G6thCtEpvhAqGxVwT2P3NMQfT0OQ4KAagfW2MgepUXoYA+26nFiTt/0GXABDqcGXP3
         72Dnq+TbaAkDyyj0xWgRJKxKYJwMegMFPb7pUBViQzzqmkSWesp/I5N+5eGAbyc5nWjZ
         sdh1CzwCFVrEa8nKxXCYxn0NQHMizPSQPrZZRL5gki1i/j5+M6VItbB+z7/NBccPuaM4
         CBDhQNZYOq/siNnF4xl7iXvP3+N2bQRj7UTBfgYQg9ZjqxG3bqSr+Y9QwoANHqC2HQqx
         NV/Q==
X-Gm-Message-State: AOJu0YxYjfAv6iUu3EQFodVCRopg3Ja++TM/eSUY3dmeh9YcczgSgpUo
	hXwBOdmkr76JoYJirC9eWUSObvh0KeC/CYc5CQKy/nCh7RPX4kKmyg0m
X-Gm-Gg: AY/fxX7K1anh/a4Iv0OBQN6GHvVSmEVNjGfO5UOUlgGz1BwPPmGIUWg2TehT4Z0ubxj
	3yN6vlUILtEmgG82VBjiAn+y09+GpzirDt6etVLPIy+oDh8YXXZeGD/lXzp42od5NlnW7UqDPXo
	xVvP/s9jk3auJhsjKuTxjtssNsxHbL8RqmKiCYKa2KBiAG583hlOTAVXh1yPRs6P73iLWjSJ6lE
	/w07Ht9wABrasSeCDcrAnvB6IF9hEcjHEIiMyCunyS2vRt4ptdJvsFuT3DbOt5dIPAn3QltGZqt
	L6jF2p4gvlQZl+/e1jW11O5OSbsEOWZFepzby7O6WGjY7QPA5Mi6/YsWfOTsxl2BeJHEo4Xxu3e
	Nk9z1euo9NZ3JTkECikJzfwWjNgQPzbI1iizofyb4GxLGLqh4nB/GmmBXYNH//xT4RthpoLs5qk
	xgANeE4DwisDj2i5BdyyvdSB2AyNN9cR2smUw=
X-Google-Smtp-Source: AGHT+IG29yZNPo3KnIDRrpM1EC1krjpGUVVVXmvpFTbrSkMxYOKgDyJ11xHP3+BnDfL7OJR9lUcWuA==
X-Received: by 2002:a05:6a20:3d88:b0:35f:aa1b:bbfb with SMTP id adf61e73a8af0-376aa6f7feamr361215637.50.1766082449411;
        Thu, 18 Dec 2025 10:27:29 -0800 (PST)
Received: from nikhil-s-Swift-SFG14-73.. ([101.0.62.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79a164d0sm32378a12.10.2025.12.18.10.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 10:27:28 -0800 (PST)
From: Nikhil S <nikhilsunilkumar@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil S <nikhilsunilkumar@gmail.com>
Subject: [PATCH v4] media: dvb-core: fix style violation issues
Date: Thu, 18 Dec 2025 23:57:14 +0530
Message-ID: <20251218182721.5478-1-nikhilsunilkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple checkpatch-reported style issues.

Changes in v3:
- Fix function argument alignment issue

Changes in v3:
- Fix function argument alignment

Changes in v2:
 - Split multiple assignments into separate lines
 - fix reported spacing issues

Signed-off-by: Nikhil S <nikhilsunilkumar@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 184 ++++++++++++++++---------------
 1 file changed, 97 insertions(+), 87 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index 8bb8dd34c223..9bd4b16090f8 100644
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
@@ -1646,8 +1657,7 @@ void dvb_net_release (struct dvb_net *dvbnet)
 EXPORT_SYMBOL(dvb_net_release);
 
 
-int dvb_net_init (struct dvb_adapter *adap, struct dvb_net *dvbnet,
-		  struct dmx_demux *dmx)
+int dvb_net_init(struct dvb_adapter *adap, struct dvb_net *dvbnet, struct dmx_demux *dmx)
 {
 	int i;
 
@@ -1655,7 +1665,7 @@ int dvb_net_init (struct dvb_adapter *adap, struct dvb_net *dvbnet,
 	mutex_init(&dvbnet->remove_mutex);
 	dvbnet->demux = dmx;
 
-	for (i=0; i<DVB_NET_DEVICES_MAX; i++)
+	for (i = 0; i < DVB_NET_DEVICES_MAX; i++)
 		dvbnet->state[i] = 0;
 
 	return dvb_register_device(adap, &dvbnet->dvbdev, &dvbdev_net,
-- 
2.43.0


