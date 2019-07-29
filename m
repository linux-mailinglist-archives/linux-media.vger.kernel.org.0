Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95E72788A4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 11:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfG2Jkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 05:40:49 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:40192 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfG2Jkt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 05:40:49 -0400
Received: by mail-pf1-f176.google.com with SMTP id p184so27729116pfp.7;
        Mon, 29 Jul 2019 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=kw/X5PHvyhK+OPglhkZH2PrJCm66ztyP4P0qwlP8Hr0=;
        b=PIRU+WPDU7Kb14O9rKBbjcvhEvWoo3Agt5kST4Gh2mzgeQzF2kueO4h60oIDShPQiO
         RMxaDQOYAtUYif69BWsTbTMgVhehKQFCyth2Nb0P/zVRaxTLTNqcTDA4cCsruZmE5qBs
         11wWLyVSUqJFAffo/mPWABVIF1p99NlslStd8bdmLtwr6KomHnlIdsumg1YDHbwso6b4
         018QtqfmefGoI02ixaOrPS6hfSt0lJhCAmFnNgGn5IuuTjRwStUExYPF/7vNOeb28iRw
         UrbNVZ6ILshiCUqNUzEckUKN0UWwe/GKp/dNZOK5oLujQLGO8FKdLA2pfUrJDwNVVVth
         VEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=kw/X5PHvyhK+OPglhkZH2PrJCm66ztyP4P0qwlP8Hr0=;
        b=LBI0JzrQfZv9Juywa9862oTppr7+NKSqdZzUEeAJXFr/ZlxaMLTYFWFFC48hUm7CNi
         TuSi3LzXX+SdNbjH8EjTpqup/HdLiqcYwG8h7dqEbrBZMQWRzM5odAV4x1XzpXeDQS7+
         Ef8fOwWyWACACJ5j1iNJHBvKkeVcznTIDYdNdvse2vVkJr9c3qyplVIUzWnjRKPaa3yx
         GxxWKu1GQad2TwGIJBSNeigyngdrZXfzGAf02aIq6Bo5Kra+mLO15xQECKKDZG1ayFoI
         A3AWN/Uc4K4DDAqKNLM21sA9z1OGpKSNe3Q5Ac1XvhtACBc9xF1bsCAt7YXS6wWHTSWw
         7+Eg==
X-Gm-Message-State: APjAAAUDuOa6UEx92Aqe9fJ1fQTA9q8Qu8iL6hXOxAOmElW0nGKJwgTC
        +I4wHH3XUbDG3rfSHI9HWo/KaBKR3hQ=
X-Google-Smtp-Source: APXvYqzcrCWxWRHGoAN/iiUkYudCU+3IUU9keptoL836xU/F9rUN0q6xRmX0gioUquT0orDrVhdakA==
X-Received: by 2002:a63:7b18:: with SMTP id w24mr102859972pgc.328.1564393248396;
        Mon, 29 Jul 2019 02:40:48 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
        by smtp.gmail.com with ESMTPSA id g2sm64960696pfi.26.2019.07.29.02.40.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 02:40:48 -0700 (PDT)
To:     awalls@md.metrocast.net, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] media: pci: cx18: a possible null-pointer dereference in
 cx18_vapi()
Message-ID: <d49c3c7d-1f2c-6eae-414e-b8e8bc813ebc@gmail.com>
Date:   Mon, 29 Jul 2019 17:40:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In cx18_vapi(), when cx is NULL, it is still used on line 833:
     CX18_ERR("cx == NULL (cmd=%x)\n", cmd);
          v4l2_err(&cx->v4l2_dev, fmt , ## args)

Thus, a possible null-pointer dereference may occur.

This bug is found by a static analysis tool STCheck written by us.

I do not know how to correctly fix this bug, so I only report it.


Best wishes,
Jia-Ju Bai
