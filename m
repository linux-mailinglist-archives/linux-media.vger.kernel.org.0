Return-Path: <linux-media+bounces-49001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 354DECC8E9D
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 17:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6D243026FB4
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 16:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799F234DCC2;
	Wed, 17 Dec 2025 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEJ5frIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819AF1DF254
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988866; cv=none; b=vGee6kgIuBnvQvKj2vPfWW7/bAfdT1FGrurW6IW4JZLKe1VFkEcfYJyQoz/04OxZwhUz8yx33fyd0NavVsUzgkNYnn7PUHee+bwwtZsEJFSm52pS4CUia4r+RCe7vVUk7n65xdVfnLZVtR/egde6cC+Prq+OCgtoQh7ojS1T3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988866; c=relaxed/simple;
	bh=cIJG0hi6oFBVpQviknmF2sONb8zbjaIbgOl4OmQlsEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OCgMi1OlQV4bC4Bdm02hDfIWdnysCtGKi0LqEbadbiNjmt617Q7HEoI3TD7vVothFvTSd2Is7UseXID0qeurQ2KC0aupzFZQJ83365V+Wd4TY4PI4defgbi6ptpPQk4sTSklDng26KVljOZcwm6eNiQEGCexQIgItL+f4MIyAnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEJ5frIU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c21417781so5276932a91.3
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 08:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988863; x=1766593663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPinUVc15TKt2VbJQgiqZ0Bz7xUkZ9R/jZyR6JPOey4=;
        b=bEJ5frIUAQ9e+geraD03/EFFp7WkmqyQz7TfXyOlNfFrW9Pu1oTKPYK8TRSINaOeQI
         C7aXQCGaMFoCQWxIvAF+7cqs64ddbXE0Eujn7IpFmDuWGzC6ePiQSAlKmxngSg3CCPCT
         UGCDrmPuvFGJnyZFw6ByPrWG8NvVQ36HoaFLUhDGVywcy8BvkYqVwlnG8Tgmt5hG7njQ
         CEGh/mCdgRyrDKkbxRzxADZ1IMGizk2SchQZczSkgY2kAr0q//qSZ3vm69HMpxupWFY+
         lKzVYR/g3WnNRJgiYtnTAd5r4adFK4btyGu+xse1NPBaYERtnAoUFPczmcb0OkRwDCx7
         0vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988863; x=1766593663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPinUVc15TKt2VbJQgiqZ0Bz7xUkZ9R/jZyR6JPOey4=;
        b=XuuoKLaRwuQ2lZeEpiHdoQe4n/ckqJMxXmKhqhNj9TiTl/MbhDchiW/ybtbU4P7YQR
         tJM7CpeSSZOP4Yl877r+KirZcHF44gRqa/kvm/D7yZotgkC5SHsyeWrWGN6kIhdzMoxZ
         2lZnV9Q4QMYFVTCUFHjw3Eh2HT36paqneNAzeV7PZfOH0V/nDpvD/og/zSHuneWVbvO0
         oOGd//oRGgNJ7CA/eIMLJ3/gp9hkiccPaacKtMtwiM4zc5XyetPz4E7enHGteRdCIbJO
         /UZaBMjXPAbQWHkBT0xWYpZKtULUkF3mnffE+GIM0FXC7hkUZGHP6MOAWhH2EBjeLY+w
         TvuQ==
X-Gm-Message-State: AOJu0Yy0cXdF2+ta/HwvZ/t6BPilCIoXgXWuiKs0q896U4O/UfK6a+mc
	XgspL4yW3mwJ90yxh1KYPrMpGTU6G2ZjtuT/bDYa3iKmfLqoTM+HNK7Ub9cY5Q==
X-Gm-Gg: AY/fxX5FOay+/rPiQ4Q+Qylrr+C4QfzCNK9KV/pP5QWO7k/Agg+gTSdShmCvGxk91uy
	onzkQhmS9kzPJDK0ERs90sQ9PXvigdosEj5cwchhBLv0dhnqUoUdMzJoqzTDpHN1BDIkuAWNXI8
	dQseqS0dsbnVxW1EIn7rx7XpFIzmBXWNHhMtwmGvn0r/hGtAhNRu/UOjGMkFKhbHdAWl0puUw0F
	KS/gil79ja0rAuHTNCTHVOxggXr3IU9+eUjRULeouQmQjN0jJMN4MtbtgzgmS9nWAV3DIYYkUBh
	S7p8aRbK0ZMzui4qiSCQRTXv4QOa0sKLw5tOsygsXLvHtD6xPvdejbt/9EoxlqGPY4Pr7GRK8Bj
	Q6BYb+DQEMAWZ1+KyBwVWhSmiJYn5OK0/QyZJAqrOP325g3EgHWrOMgpTlGkhxJzA7P8KxUk/Ch
	1zfarOM8ofhxItCSM4QJh9TKhCDAwiHtA0Pq0=
X-Google-Smtp-Source: AGHT+IHqZ9aGHisdq0oIFzQQXGnVIPN/VjbsAfOV2ONnFe9Mdz1QGCC5BcE56BzY5if1GKsGRw0w9w==
X-Received: by 2002:a17:90b:2811:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34abd6d35c0mr17259596a91.15.1765988862500;
        Wed, 17 Dec 2025 08:27:42 -0800 (PST)
Received: from nikhil-s-Swift-SFG14-73.. ([101.0.62.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d3d7f1sm70915a91.4.2025.12.17.08.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:27:41 -0800 (PST)
From: Nikhil S <nikhilsunilkumar@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil S <nikhilsunilkumar@gmail.com>
Subject: [PATCH v3] media: dvb-core: fix style violation issues
Date: Wed, 17 Dec 2025 21:57:21 +0530
Message-ID: <20251217162734.5744-1-nikhilsunilkumar@gmail.com>
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
- Fix function argument alignment

Changes in v2:
 - Split multiple assignments into separate lines
 - fix reported spacing issues

Signed-off-by: Nikhil S <nikhilsunilkumar@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 185 ++++++++++++++++---------------
 1 file changed, 98 insertions(+), 87 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index 8bb8dd34c223..a18e77451659 100644
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
@@ -1646,8 +1657,8 @@ void dvb_net_release (struct dvb_net *dvbnet)
 EXPORT_SYMBOL(dvb_net_release);
 
 
-int dvb_net_init (struct dvb_adapter *adap, struct dvb_net *dvbnet,
-		  struct dmx_demux *dmx)
+int dvb_net_init(struct dvb_adapter *adap, struct dvb_net *dvbnet,
+		struct dmx_demux *dmx)
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


