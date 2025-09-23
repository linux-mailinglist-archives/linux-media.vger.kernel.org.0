Return-Path: <linux-media+bounces-42987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45AB9595A
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 13:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6EAB19C2129
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 11:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6953218D0;
	Tue, 23 Sep 2025 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="or128UEB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB653218AF
	for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625944; cv=none; b=s1PW9t737zhrmjkcxV/ZSfU2GSqrsJbKz/meVrXmjkr5aFIfnfGHE57Bmx2+CDAw418X6iVFGmSNLMfgOQBV6AP7M/JzHohqDrnR2csb/DZfRQ8WSrWPOK1uOMX0awGkgKyZsbwN6Xbnzm2umKki4vo+xJj/waUmIu0207ETSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625944; c=relaxed/simple;
	bh=HFXWoJtgyEegLCXKmBtcrHh7SPZYhUlcfHGplffoHdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JCrQvMoH4oj7wWn1Jam4u6BKmBPL65gLy01RkbQaKtUTHv863qEDJGBInDCR1vre8nAuF5CBXWXX2GBcF06iPNk4a/qGYvysY/WfMUVIa4nHd7g+FqqNzIVUcRDD9w+CkYtu3HODnKG3Bl2+cJrsIj26P8RgOsTWCC5E98Y0A5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=or128UEB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46d25f99d5aso14269095e9.0
        for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758625940; x=1759230740; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OOLEmLWfvIlarI1nvJ7f0m4S3wrzPlaABnyGLbYFIk=;
        b=or128UEBhoQSk44kbUVWcOAxydH+/cCK8Lt7fpI6b5PiU0jx0BhAH4sgsxUfSkk7FP
         GrEa6H2nYACOeZVPTJJwDe+CRUwHyA4zdtoP0qH99IPtTa7TXLmaLyZdEafDopvLl0f0
         nRRGGj1Ujfo0+eWCu7JrfcX/DnqLz0mYHz2ABi3WZI+VWug8HtFc3p7GibvynalFzqv7
         pnHXIdQSs1bEz7QTyl/hGJ+o/rEyWKRcfTprrN2g2kmCe970/Yefn234zojYugS7dh3C
         SNXjQogfJG9yPqA2RRWVoZSuBI/Hz0AJL0du6TwJHoGq1b2dsx1DkwYWjkboYpDgO92t
         zClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625940; x=1759230740;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OOLEmLWfvIlarI1nvJ7f0m4S3wrzPlaABnyGLbYFIk=;
        b=hKYie6U6HT9dHtDYsGGEDGqa3R3fBPq+4MDq4mIWDVN7qh8joaTPBUVwk4IqjuX6ey
         UTr2D7NakLOb+PA8getbwKi2Pnd1lUAC4hsmaNSt7rU9wwNELLVapLN8FeyhxEnEKznW
         eytsuu3vuWc/eLUa1lPRMdD1OxULPBzev985xP3JuCkXeYs3VddBNWdhgXHgCmDXA8qL
         082ng04+XgewbNcsGuL+/dHFVcxQU+o0Wx//n6y1tkoBK8ptz2xnwckv5Rl+Baq4BD3r
         QZTag9e2R/h+xA62s03b/WOXfs18PlNkiSZsQiqI7ytZVSz6ZHN0Zsth97N7BotDRuPV
         jIdA==
X-Gm-Message-State: AOJu0YzDjUoBzpgJ3qbSc3U4TM7rwbkbBR5x7sJjvT7EbZ23cCQqTkoA
	UTaVGmQ2x67RY6kM/gYhXzJQm9BW4SkBWpCWRFiPXtP7IzjaoB8+Nh/uEI5N45GDPm4=
X-Gm-Gg: ASbGncs2pmwkTVN3+B7hm8yQ0Uksbi5DkMhQDs1Mc37C5/sAmwqqYi7gJqLkwFPzgTf
	uYl1tUJ21syESzhXmAH7nsql7/0OFLdH5QVIKVi5od+sAkuaY4amGhZcmYgEVWLXS2dvXeAzc8a
	ld4O/SaV1QkMEQWEz8f5qMMoAAtOCgh+1zcfJWLzD0rCtzvBanOdWLuQxAB+PAGQQXjYCWH6gbi
	JmxKYygle5avSQ6UBZj10ayXWH7zcBecgKCnHoqFy/XenSlPAeK3kf8rq3cAgnLvLRUgCS6oKjG
	NYG84eZ8fy0Ywn0h5PM0xbT/vZMTA6V97d00Z9M9hZKHSPlUOMW3QrkaJ0I27L73EKEQ86GBAMo
	036aC6gKYgBRjPqAMDmPvnL4nryT7
X-Google-Smtp-Source: AGHT+IFoAb7J/d9kWoMl79X2Rl509Bfci5NE25Raj8v8BWwKjOqL96rpbUK9RgH4cFGi6YzRWVZXNw==
X-Received: by 2002:a05:6000:178e:b0:401:2cbf:ccad with SMTP id ffacd0b85a97d-405cf9c1c48mr1676695f8f.17.1758625940297;
        Tue, 23 Sep 2025 04:12:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee106fd0edsm22901843f8f.53.2025.09.23.04.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:12:19 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:12:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-media@vger.kernel.org
Subject: [bug report] dma-buf: Exercise dma-fence-chain under selftests
Message-ID: <aNKAkLF2-0TeW3o7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Chris Wilson,

Commit dc2f7e67a28a ("dma-buf: Exercise dma-fence-chain under
selftests") from Apr 9, 2020 (linux-next), leads to the following
Smatch static checker warning:

	drivers/dma-buf/st-dma-fence-chain.c:216 find_seqno()
	warn: passing freed memory 'fence' (line 203)

drivers/dma-buf/st-dma-fence-chain.c
    181 static int find_seqno(void *arg)
    182 {
    183         struct fence_chains fc;
    184         struct dma_fence *fence;
    185         int err;
    186         int i;
    187 
    188         err = fence_chains_init(&fc, 64, seqno_inc);
    189         if (err)
    190                 return err;
    191 
    192         fence = dma_fence_get(fc.tail);
    193         err = dma_fence_chain_find_seqno(&fence, 0);
    194         dma_fence_put(fence);
    195         if (err) {
    196                 pr_err("Reported %d for find_seqno(0)!\n", err);
    197                 goto err;
    198         }
    199 
    200         for (i = 0; i < fc.chain_length; i++) {
    201                 fence = dma_fence_get(fc.tail);
    202                 err = dma_fence_chain_find_seqno(&fence, i + 1);
    203                 dma_fence_put(fence);
                        ^^^^^^^^^^^^^^^^^^^^^
I don't understand the ref counting.  Shouldn't we have to assume that
after this dma_fence_put() a different thread could release fence?

    204                 if (err) {
    205                         pr_err("Reported %d for find_seqno(%d:%d)!\n",
    206                                err, fc.chain_length + 1, i + 1);
    207                         goto err;
    208                 }
    209                 if (fence != fc.chains[i]) {
                            ^^^^^
Every later reference to fence would be a potential use after free.

    210                         pr_err("Incorrect fence reported by find_seqno(%d:%d)\n",
    211                                fc.chain_length + 1, i + 1);
    212                         err = -EINVAL;
    213                         goto err;
    214                 }
    215 
--> 216                 dma_fence_get(fence);

Calling dma_fence_get() wouldn't unfree it.

    217                 err = dma_fence_chain_find_seqno(&fence, i + 1);
    218                 dma_fence_put(fence);
    219                 if (err) {
    220                         pr_err("Error reported for finding self\n");
    221                         goto err;
    222                 }
    223                 if (fence != fc.chains[i]) {
    224                         pr_err("Incorrect fence reported by find self\n");
    225                         err = -EINVAL;
    226                         goto err;
    227                 }
    228 
    229                 dma_fence_get(fence);
    230                 err = dma_fence_chain_find_seqno(&fence, i + 2);
    231                 dma_fence_put(fence);
    232                 if (!err) {
    233                         pr_err("Error not reported for future fence: find_seqno(%d:%d)!\n",
    234                                i + 1, i + 2);
    235                         err = -EINVAL;
    236                         goto err;
    237                 }
    238 
    239                 dma_fence_get(fence);
    240                 err = dma_fence_chain_find_seqno(&fence, i);
    241                 dma_fence_put(fence);
    242                 if (err) {
    243                         pr_err("Error reported for previous fence!\n");
    244                         goto err;
    245                 }
    246                 if (i > 0 && fence != fc.chains[i - 1]) {
    247                         pr_err("Incorrect fence reported by find_seqno(%d:%d)\n",
    248                                i + 1, i);
    249                         err = -EINVAL;
    250                         goto err;
    251                 }
    252         }
    253 
    254 err:
    255         fence_chains_fini(&fc);
    256         return err;
    257 }

regards,
dan carpenter

