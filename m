Return-Path: <linux-media+bounces-42249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 783BDB52864
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 07:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E50B567A21
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 05:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA69D253939;
	Thu, 11 Sep 2025 05:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gqHy4Gm5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B023C50F
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 05:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757570257; cv=none; b=uATv+VSGMKGGRxZOAwScb1yzu89nALA1ant9wQv9tQiWj6bhkSjgTEEkm9uedijrTnbAlObGkMkAFi36GdUv67woPz6hT9HfHdsxoj2+0xH5nAcdRILZlFl/hVqgOXmxGANmC9xMkULP0jTHBIuXfizOMUA2YC3VDoDipP4OE34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757570257; c=relaxed/simple;
	bh=exLOA+plq4aAdXXrAyexOx/FbjLXOAs3sMXGj5Mvz2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oBSc/cjm3EGworDfUJByCXdCwwaMtkSdHBEleZiSsW6/Gu0y+bbjN+116MtOZrIAWjhC92TnAx72AYWkZEJXyEY98f+DnO+dDXdnB7L76OSYyaZFFnxJDEkOwGyV0+S12u/6PIvmVJkv8u3UMLyYrnrGPtJumuKM3wbZ9K3b7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gqHy4Gm5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so1902065e9.1
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757570253; x=1758175053; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78GrfH4idd31dTpCjweV3UBQCJ4U2J/Ofd4dzQcjsPs=;
        b=gqHy4Gm51WTDX4gJpdIxnHwOboJmPCvuj1Zxf0j5ybQdKRbJhyK88TedUQwO245Wvq
         z/P7etE5Ma+pdNOCo8K1Ki4yBDySUmJMydjW40XzojGFsKgzlHoGUv0010apukGvujQY
         5vwAFWSBkrjwn/ApsLNz6rfFARa+jaD74wBvnzX29l0KVfv+Sf5ja38e8en9vrsb/k9h
         ncq5rvvhxJZav3Hd1OZwHUzXuFazNc0w0CGR3AYDrD0UZi8mUNN56M+iP2wsvAzQBl1Y
         KL1L7Zf/V3BV+1UbrX4BXuJKkx2LmEpMABI6dHrJMVZmfxY7a4KMsiDY2vM85Ki6hhp7
         k5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757570253; x=1758175053;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78GrfH4idd31dTpCjweV3UBQCJ4U2J/Ofd4dzQcjsPs=;
        b=NETlc7CTS60n8yhAxBahFyoY9qewT1FfztadXzafqJtNhkQVpHr40rTUP+D3Ykrcbu
         Is5B40h9U5VQq6rdGa0y4/9heDo3hvxMEcP4QD5NXKsTW3D8trOWFbWfMw17LlkW9TGt
         RqqK8Iy69UNDE0pyqUsUpiek0dyRIPPGHbGHcGmQmY0dk3TJbFm0L1UERosBIkONGfkq
         H7vTpdFxv9h8Gwy/qxby9xlQIrTAv/ezRoTOqNo3oU2CUlp9rTbynI3p6HJA3EOmxGyQ
         2NIpVqarefTkA5+fkwLfcFw1uvbdPVDb88vLZzeqGRy+cEGZwNUZINGl2kbsSuK6OjrS
         xuIw==
X-Gm-Message-State: AOJu0YxpKQhDBf857Tnvb+gApXS7uHbOYczmOLTIJJ2LIq3GbJbAIZs2
	ipPgLZMVqFWsnTvhsafVLvWbXp1ZkFsyDMUD/QjwWkKofj6PmixJGi5stsqNRp8rftM=
X-Gm-Gg: ASbGncuKE4elTsTnekg4DvvqPlFudbA0TuEgbkWmgvO9U/9rkGiT2cOybwsZoC1dW8H
	S6aRJsSVuQv4i19Ucrsh4ynINu75PExN8h0L3qZ96h89bB/dVNL4J0giMe9ZiJmqxiBsAD/mnBK
	QngglaGivCGNFc65ifTE3vWB4HmnY6W1cnurEImhVLFZ3lbJluKSdasVOkQjtpRE3cj2YWXMFqH
	AilbM5cZ43Fffm3/bXW6e1/rWEbaz8uc3eV0YT3/Wx+DNSrhnWD82qkCAuzmSU+G2l2VY1EjhDL
	gN9oMlu7SxqqRGqiL2FelEWxIhmxIqUYmFSr8U/MqlvAnRmGOPgt23mV/4vTAFtUKCp/jafECLW
	mDkafyWx4auuPaq85KVngCrJ+KbnR6lo7hr7V/Ys24K4qCUK9
X-Google-Smtp-Source: AGHT+IHuqE3HLaz4W6FU3U3IYekMV9vOvu/YNIto9tWGCF3HFHVx9FRKe5d+qSGKeZmViAzeUUt4RQ==
X-Received: by 2002:a05:600c:548a:b0:45d:db33:fa0a with SMTP id 5b1f17b1804b1-45dddee3772mr162539865e9.33.1757570253224;
        Wed, 10 Sep 2025 22:57:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e03718c6fsm10123035e9.2.2025.09.10.22.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 22:57:32 -0700 (PDT)
Date: Thu, 11 Sep 2025 08:57:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] mtd: Add driver for concatenating devices
Message-ID: <aMJkydc_WLNVysUn@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Amit Kumar Mahapatra,

Commit fa47dc829519 ("mtd: Add driver for concatenating devices")
from Jun 23, 2025 (linux-next), leads to the following Smatch static
checker warnings:

drivers/media/pci/cobalt/cobalt-flash.c:114 cobalt_flash_remove() warn: passing freed memory 'cobalt->mtd' (line 113)
drivers/mtd/devices/block2mtd.c:523 block2mtd_exit() warn: 'dev->mtd.name' double freed
drivers/mtd/devices/docg3.c:1882 doc_release_device() error: double free of 'mtd' (line 1879)
drivers/mtd/devices/mtdram.c:119 cleanup_mtdram() error: dereferencing freed memory 'mtd_info' (line 118)
drivers/mtd/devices/phram.c:120 unregister_devices() error: double free of 'this->mtd.name' (line 118)
drivers/mtd/devices/pmc551.c:839 cleanup_pmc551() error: double free of 'mtd' (line 838)
drivers/mtd/devices/slram.c:206 unregister_devices() error: dereferencing freed memory 'slram_mtdlist->mtdinfo' (line 205)
drivers/mtd/hyperbus/hyperbus-core.c:133 hyperbus_unregister_device() warn: passing freed memory 'hbdev->mtd' (line 132)
drivers/mtd/maps/amd76xrom.c:87 amd76xrom_cleanup() warn: passing freed memory 'map->mtd' (line 86)
drivers/mtd/maps/ck804xrom.c:99 ck804xrom_cleanup() warn: passing freed memory 'map->mtd' (line 98)
drivers/mtd/maps/esb2rom.c:133 esb2rom_cleanup() warn: passing freed memory 'map->mtd' (line 132)
drivers/mtd/maps/ichxrom.c:74 ichxrom_cleanup() warn: passing freed memory 'map->mtd' (line 73)
drivers/mtd/maps/l440gx.c:157 cleanup_l440gx() warn: 'mymtd' was already freed. (line 156)
drivers/mtd/maps/netsc520.c:114 cleanup_netsc520() warn: 'mymtd' was already freed. (line 113)
drivers/mtd/maps/nettel.c:410 nettel_init() warn: 'intel_mtd' was already freed. (line 408)
drivers/mtd/maps/nettel.c:431 nettel_cleanup() warn: 'amd_mtd' was already freed. (line 430)
drivers/mtd/maps/nettel.c:444 nettel_cleanup() warn: 'intel_mtd' was already freed. (line 443)
drivers/mtd/maps/pci.c:311 mtd_pci_remove() warn: 'mtd' was already freed. (line 310)
drivers/mtd/maps/pcmciamtd.c:662 pcmciamtd_detach() error: dereferencing freed memory 'dev->mtd_info' (line 661)
drivers/mtd/maps/physmap-core.c:78 physmap_flash_remove() warn: passing freed memory 'info->cmtd' (line 75)
drivers/mtd/maps/plat-ram.c:79 platram_remove() warn: passing freed memory 'info->mtd' (line 78)
drivers/mtd/maps/sbc_gxx.c:174 cleanup_sbc_gxx() warn: 'all_mtd' was already freed. (line 173)
drivers/mtd/maps/sc520cdp.c:274 cleanup_sc520cdp() warn: 'merged_mtd' was already freed. (line 273)
drivers/mtd/maps/scb2_flash.c:183 scb2_flash_probe() warn: passing freed memory 'scb2_mtd' (line 182)
drivers/mtd/maps/scb2_flash.c:208 scb2_flash_remove() warn: passing freed memory 'scb2_mtd' (line 207)
drivers/mtd/maps/ts5500_flash.c:93 cleanup_ts5500_map() warn: 'mymtd' was already freed. (line 92)
drivers/mtd/mtd_virt_concat.c:78 mtd_virt_concat_destroy_joins() error: dereferencing freed memory 'mtd' (line 77)
drivers/mtd/nand/onenand/onenand_base.c:4020 onenand_release() error: dereferencing freed memory 'mtd' (line 4003)
drivers/mtd/nand/raw/ams-delta.c:412 gpio_nand_remove() warn: 'mtd' was already freed. (line 410)
drivers/mtd/ubi/gluebi.c:371 gluebi_remove() error: dereferencing freed memory 'mtd' (line 369)
drivers/mtd/ubi/gluebi.c:487 ubi_gluebi_exit() error: dereferencing freed memory 'mtd' (line 485)

drivers/media/pci/cobalt/cobalt-flash.c
    110 void cobalt_flash_remove(struct cobalt *cobalt)
    111 {
    112         if (cobalt->mtd) {
    113                 mtd_device_unregister(cobalt->mtd);
--> 114                 map_destroy(cobalt->mtd);

This is a use after free and a double free etc.

    115         }
    116 }

The problem is that mtd_virt_concat_destroy() frees the mtd.

drivers/mtd/mtdcore.c
    91  int mtd_virt_concat_destroy(struct mtd_info *mtd)
    92  {
    93          struct mtd_info *child, *master = mtd_get_master(mtd);
    94          struct mtd_virt_concat_node *item, *tmp;
    95          struct mtd_concat *concat;
    96          int idx, ret = 0;
    97          bool is_mtd_found;
    98  
    99          list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
   100                  is_mtd_found = false;
   101  
   102                  /* Find the concat item that hold the mtd device */
   103                  for (idx = 0; idx < item->count; idx++) {
   104                          if (item->nodes[idx] == mtd->dev.of_node) {
   105                                  is_mtd_found = true;
   106                                  break;
   107                          }
   108                  }
   109                  if (!is_mtd_found)
   110                          continue;
   111                  concat = item->concat;
   112  
   113                  /*
   114                   * Since this concatenated device is being removed, retrieve
   115                   * all MTD devices that are part of it and register them
   116                   * individually.
   117                   */
   118                  for (idx = 0; idx < concat->num_subdev; idx++) {
   119                          child = concat->subdev[idx];
   120                          if (child->dev.of_node != mtd->dev.of_node) {
   121                                  ret = add_mtd_device(child);
   122                                  if (ret)
   123                                          goto out;
   124                          }
   125                  }
   126                  /* Destroy the concat */
   127                  if (concat->mtd.name) {
   128                          del_mtd_device(&concat->mtd);
   129                          kfree(concat->mtd.name);
   130                          mtd_concat_destroy(&concat->mtd);
   131                          mtd_virt_concat_put_mtd_devices(item->concat);
   132                  }
   133  
   134                  for (idx = 0; idx < item->count; idx++)
   135                          of_node_put(item->nodes[idx]);
   136  
   137                  kfree(item->nodes);
   138                  kfree(item);
   139          }
   140          return 0;
   141  out:
   142          mutex_lock(&master->master.partitions_lock);
   143          list_del(&child->part.node);
   144          mutex_unlock(&master->master.partitions_lock);
   145          kfree(mtd->name);
   146          kfree(mtd);
                ^^^^^^^^^^
   147  
   148          return ret;
   149  }

regards,
dan carpenter

