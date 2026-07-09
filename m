Return-Path: <linux-media+bounces-67137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WofbAWt6T2oYhwIAu9opvQ
	(envelope-from <linux-media+bounces-67137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 12:39:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8D972FB7E
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 12:39:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="N2yGOg/w";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67137-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67137-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 888523085DB6
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 10:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7104640629E;
	Thu,  9 Jul 2026 10:36:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEFF3B19C1
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 10:36:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593381; cv=none; b=XtQhzsR8SPWY1wJnobrIFejfhyhwp17ds1ysXYid5ZUvzz3S6IDpEhOAPcfUblHOO954plKWI/4jvYLbUujI+bbri+LU/cwK4v9Trt5Egz1dKNE1IoLxSzciqWSzScGzQwe/2fCqyw/zl0KpVvh0vvCyOvJEGjUyYRVFwbJCTe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593381; c=relaxed/simple;
	bh=qxX0dE0OBUtqw9JQvY1JePBsbgseMjd5rGtMEwrM+T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FHyjJapJ17oCQ31E+0Qt00X5K9FohM/7X+c3rGQL0KJONRIT/Ff10oRClWG9dgE5rxbWN9Vn65uktem4JT4uqy1YMdPgAPT/n2vjvV2ehuj9wrm/8sMTNOVBUJr3FTeC1v9rwwQB/Q5VWEdR96iWqrGBQNRUzwkJ6sT6GoLjzUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2yGOg/w; arc=none smtp.client-ip=209.85.167.177
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-48f0e5e6698so431947b6e.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593379; x=1784198179; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoqXSN8PEKoTPPLhPa7oguIX3My0y2fKQVIp51mrWN4=;
        b=N2yGOg/wWimCQ4yyA9Jx8/hkRC9cCBHKLSrkcU4+6I3P4j+JMKfwqddK+jPpaigU9A
         r/+3MweGyLCEVaqECB0tnRSVDbQ8aZuf8lZlLznVpex2LGNL5RgfkF7aqBx2ivwsc0Ch
         wk4ZRDOO3+VY7j7JWxyZaiN+PgcaOUXZKSC462kgbrpbCMCfU8aSzfmxmaCSPTAM7gKW
         8ykOFEGcay3SfY/PBcv8t3aevKVQTSk6AWEJmht7reao4IM5OiDbFIEabxJnnNQgja0+
         9f5dQ3L0RjbsZklPcQAIUWCTV9UBvYlgKjgjtsLEg7p9CKeueTuSBvgTkEZbi2C09Ni5
         2lQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593379; x=1784198179;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoqXSN8PEKoTPPLhPa7oguIX3My0y2fKQVIp51mrWN4=;
        b=g0SKknQis7jo//1ZKJEXHvFUQnzSXSfLGzloTmXr5AWqo//uySDIxNF4P2u6P4sPes
         J9//VfcuSYhd9is2eoD/r+h7GViMSQGOfkFbCT4hlQ7i+Iin44x2yatelVQC8a6kltar
         +yw1Pa39FHRTUnnF4NVdJt6ALC75dzMfjXlobrcUw7ybaaioVAkZZMtxEjMOIHA9FBh2
         hsmTiwaFuKrpr+BSxBsh6u2qJt3UoJeYZRUUYg1n3izPZZ9ZRE/3yapxUo+qccBBcfRg
         f69qwMASLSVbn/5O7kcw/AoBRBPaot61wiPZXfY0PBPVGs+WVuM60UphrzFaG19s0EUp
         EgEg==
X-Forwarded-Encrypted: i=1; AFNElJ8FqGWeE8h3Xn9pFXwkDbYG+sSjcY/GhukZWX4psplfifvkodsdIcwHqHxHLxwzcw7yUs2HY2lodz5eyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXnEcGJZ0LY6iC/gC7kd430slFI5Y9zcIYqhAWgS54OdKFQ4T
	iUImzjNRhjZbh7oDL90Uyu7JOP/4kbdmsGbe0Y8g9AcYpzPe85DBsQ8bAS/C9MWJYnw=
X-Gm-Gg: AfdE7clE9VO+nsHcEf1YGiUd9OOcHxRpfO/UuHy5DYM/U9TpMp+fVuPmjjs3LviV4Jm
	SQNBE3hlUlx5GBzeY6K6ZewZx16Uc/Z6d1f98yzkWNJuVlOrcbSnVJCBHEfAIb9zqypYytguOn0
	8IOG1Gay3DtV63mOEvUEZu+GVTc8gXkCw4xAy7q0FhBTMMK/qUFJNCWeiwneJJfEfusQ8ImF/Rh
	QJUBitj444ipCe71SSS78Np8OPhJgZY2H+U6bTERQN01WKsNINhDqWG9j0iQvwluJC52ZqKT8J+
	MrczOB7bCmn3X/DXSxTUyijFekMgJzES3UutirX9nJJwIeDJRAwWViRrbMAZWiFUjrEIjJgEbfj
	mymHiSTjbsLkmtxZcSeZul58r8JaF6iLxJSWz2QDZb3hWOdYieOnmQbwpjmB1xVMpwKTrrZyaqc
	GjVlbU
X-Received: by 2002:a05:6808:1512:b0:497:da97:8c7b with SMTP id 5614622812f47-4a203fc1530mr5884922b6e.31.1783593379164;
        Thu, 09 Jul 2026 03:36:19 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1b01f1722sm3661154b6e.16.2026.07.09.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:36:17 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:36:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 98/105]
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c:853
 ipu6_isys_alloc_stream_firmware() error: double free of 'stream' (line 790)
Message-ID: <202607031449.9y46lBuM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:oe-kbuild@lists.linux.dev,m:sakari.ailus@linux.intel.com,m:lkp@intel.com,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67137-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:mid,intel.com:email,vger.kernel.org:from_smtp,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC8D972FB7E

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   a6d4ce993bcd76851cfc7f28cc33aac011a30fa9
commit: 5bd6ad739336637aa65b270823cf43a5a8f2dcab [98/105] media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260703/202607031449.9y46lBuM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031449.9y46lBuM-lkp@intel.com/

smatch warnings:
drivers/media/pci/intel/ipu6/ipu6-isys-video.c:853 ipu6_isys_alloc_stream_firmware() error: double free of 'stream' (line 790)

vim +/stream +853 drivers/media/pci/intel/ipu6/ipu6-isys-video.c

5bd6ad73933663 Sakari Ailus 2026-06-26  770  struct ipu6_isys_stream *
5bd6ad73933663 Sakari Ailus 2026-06-26  771  ipu6_isys_alloc_stream_firmware(struct ipu6_isys_csi2 *csi2,
5bd6ad73933663 Sakari Ailus 2026-06-26  772  				struct v4l2_subdev_state *csi2_state,
5bd6ad73933663 Sakari Ailus 2026-06-26  773  				struct v4l2_mbus_frame_desc *desc,
5bd6ad73933663 Sakari Ailus 2026-06-26  774  				u8 vc)
5bd6ad73933663 Sakari Ailus 2026-06-26  775  {
5bd6ad73933663 Sakari Ailus 2026-06-26  776  	struct device *dev = &csi2->isys->adev->auxdev.dev;
5bd6ad73933663 Sakari Ailus 2026-06-26  777  	struct ipu6_isys_stream *stream;
5bd6ad73933663 Sakari Ailus 2026-06-26  778  	struct v4l2_subdev_route *route;
5bd6ad73933663 Sakari Ailus 2026-06-26  779  	int ret;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  780  
5bd6ad73933663 Sakari Ailus 2026-06-26  781  	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  782  	if (!stream) {
5bd6ad73933663 Sakari Ailus 2026-06-26  783  		ret = -ENOMEM;
5bd6ad73933663 Sakari Ailus 2026-06-26  784  		goto err_free_stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  785  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  786  
5bd6ad73933663 Sakari Ailus 2026-06-26  787  	ret = ida_alloc_max(&csi2->isys->streams, IPU6_ISYS_MAX_STREAMS - 1,
5bd6ad73933663 Sakari Ailus 2026-06-26  788  			    GFP_KERNEL);
5bd6ad73933663 Sakari Ailus 2026-06-26  789  	if (ret < 0) {
5bd6ad73933663 Sakari Ailus 2026-06-26 @790  		kfree(stream);
5bd6ad73933663 Sakari Ailus 2026-06-26  791  		goto err_free_stream;

Double free on this error path.

5bd6ad73933663 Sakari Ailus 2026-06-26  792  	}
5bd6ad73933663 Sakari Ailus 2026-06-26  793  
5bd6ad73933663 Sakari Ailus 2026-06-26  794  	stream->stream_handle = ret;
5bd6ad73933663 Sakari Ailus 2026-06-26  795  	mutex_init(&stream->mutex);
5bd6ad73933663 Sakari Ailus 2026-06-26  796  	init_completion(&stream->stream_open_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  797  	init_completion(&stream->stream_close_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  798  	init_completion(&stream->stream_start_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  799  	init_completion(&stream->stream_stop_completion);
5bd6ad73933663 Sakari Ailus 2026-06-26  800  	INIT_LIST_HEAD(&stream->queues);
5bd6ad73933663 Sakari Ailus 2026-06-26  801  	stream->isys = csi2->asd.isys;
5bd6ad73933663 Sakari Ailus 2026-06-26  802  	stream->asd = &csi2->asd;
5bd6ad73933663 Sakari Ailus 2026-06-26  803  	stream->vc = vc;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  804  
5bd6ad73933663 Sakari Ailus 2026-06-26  805  	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
5bd6ad73933663 Sakari Ailus 2026-06-26  806  		stream->isys->streams_by_handle[stream->stream_handle] =
5bd6ad73933663 Sakari Ailus 2026-06-26  807  			stream;
5bd6ad73933663 Sakari Ailus 2026-06-26  808  		csi2->streams_by_vc[stream->vc] = stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  809  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  810  
5bd6ad73933663 Sakari Ailus 2026-06-26  811  	list_add(&stream->csi2_entry, &csi2->streams);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  812  
5bd6ad73933663 Sakari Ailus 2026-06-26  813  	for_each_active_route(&csi2_state->routing, route) {
5bd6ad73933663 Sakari Ailus 2026-06-26  814  		struct media_pad *vdev_pad =
5bd6ad73933663 Sakari Ailus 2026-06-26  815  			media_pad_remote_pad_first(&csi2->asd.pad[route->source_pad]);
5bd6ad73933663 Sakari Ailus 2026-06-26  816  		struct v4l2_mbus_frame_desc_entry *entry = NULL;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  817  
5bd6ad73933663 Sakari Ailus 2026-06-26  818  		for (unsigned int i = 0; i < desc->num_entries; i++) {
5bd6ad73933663 Sakari Ailus 2026-06-26  819  			if (desc->entry[i].stream != route->sink_stream)
5bd6ad73933663 Sakari Ailus 2026-06-26  820  				continue;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  821  
5bd6ad73933663 Sakari Ailus 2026-06-26  822  			entry = &desc->entry[i];
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  823  			break;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  824  		}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  825  
5bd6ad73933663 Sakari Ailus 2026-06-26  826  		if (!entry) {
5bd6ad73933663 Sakari Ailus 2026-06-26  827  			dev_dbg(dev, "cannot find stream %u in frame desc\n",
5bd6ad73933663 Sakari Ailus 2026-06-26  828  				route->sink_stream);
5bd6ad73933663 Sakari Ailus 2026-06-26  829  			ret = -EINVAL;
5bd6ad73933663 Sakari Ailus 2026-06-26  830  			goto err_ida_free;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  831  		}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  832  
5bd6ad73933663 Sakari Ailus 2026-06-26  833  		if (entry->bus.csi2.vc != vc)
5bd6ad73933663 Sakari Ailus 2026-06-26  834  			continue;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  835  
5bd6ad73933663 Sakari Ailus 2026-06-26  836  		struct ipu6_isys_video *av =
5bd6ad73933663 Sakari Ailus 2026-06-26  837  			container_of_const(vdev_pad, struct ipu6_isys_video,
5bd6ad73933663 Sakari Ailus 2026-06-26  838  					   pad);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  839  
5bd6ad73933663 Sakari Ailus 2026-06-26  840  		list_add(&av->aq.node, &stream->queues);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  841  
5bd6ad73933663 Sakari Ailus 2026-06-26  842  		stream->nr_output_pins++;
5bd6ad73933663 Sakari Ailus 2026-06-26  843  		av->stream = stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  844  	}
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  845  
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  846  	return stream;
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  847  
5bd6ad73933663 Sakari Ailus 2026-06-26  848  err_ida_free:
5bd6ad73933663 Sakari Ailus 2026-06-26  849  	list_del(&stream->csi2_entry);
5bd6ad73933663 Sakari Ailus 2026-06-26  850  	ida_free(&csi2->isys->streams, stream->stream_handle);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  851  
5bd6ad73933663 Sakari Ailus 2026-06-26  852  err_free_stream:
5bd6ad73933663 Sakari Ailus 2026-06-26 @853  	kfree(stream);

Second free.

3c1dfb5a69cf83 Bingbu Cao   2024-01-31  854  
5bd6ad73933663 Sakari Ailus 2026-06-26  855  	return ERR_PTR(ret);
3c1dfb5a69cf83 Bingbu Cao   2024-01-31  856  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


