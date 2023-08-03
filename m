Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8F076EE9A
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 17:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236969AbjHCPth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 11:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbjHCPtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 11:49:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646C7E6B
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 08:49:35 -0700 (PDT)
Received: from strictly.printclub (zone.collabora.co.uk [167.235.23.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: daniels)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 47171660719E;
        Thu,  3 Aug 2023 16:49:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1691077773;
        bh=1utPjd4nZ+4QB9HS6ftCxv82n8kl2ZtzpHU962/E6rE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SQU0Uu5AYqLN0uIinurSjZx1HaX+nIKQo7UMy5gKDFm805tu3uuhA1MlUo/eF9l1L
         5s6X0YNyVEkqjzr+koD539VbUlAiDo9relnPeDiyBQnw+kFM6Bq9KiNN0JuyFoUC/i
         am+vkZ4+gWqlppMfpgPe6S3dhbvJkDqWQ9NltCuaGRQgLKy2D836iUHbqGPeak6Igt
         Aij3am8eAYWhfDUTNZLF1cUIw+Oq3O0scunydRQjvWaVFZWkrw30/eTxc64Xmohccw
         97tGO/fNQDaYkUfRZT6Qm/9q2wmtfqyCgNqbQpmArN5a6mAGL3kIMy9B4VpTGPzp5C
         shiKdzaWWrDjQ==
From:   Daniel Stone <daniels@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] doc: uapi: Document dma-buf interop design & semantics
Date:   Thu,  3 Aug 2023 16:47:27 +0100
Message-ID: <20230803154908.105124-2-daniels@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20210905122742.86029-1-daniels@collabora.com>
References: <20210905122742.86029-1-daniels@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,
This is v2 to the linked patch series; thanks to everyone for reviewing
the initial version. I've moved this out of a pure DRM scope and into
the general userspace-API design section. Hopefully it helps others and
answers a bunch of questions.

I think it'd be great to have input/links/reflections from other
subsystems as well here.

Cheers,
Daniel


