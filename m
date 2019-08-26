Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE8899D20E
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732730AbfHZO5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:35 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:38913 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729105AbfHZO5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:35 -0400
Received: by mail-wr1-f52.google.com with SMTP id t16so15646291wra.6
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+7mU6x0kAtNzznIM6tbGCzx9BmVJw914gebmRmVgVcA=;
        b=bM5bgM6n7KLOsSzjB5IqRgzcrPS0YEt9EDnkXtZEIaYP13lfh+vYfvXjSTTbd7JgOl
         HdGCSm4vsjY6K2Xbv7rD4GGOXEo3f9tjGojgKb5356NSHspjJ7+ZlfAY0vEC9HhwYV6P
         MlUKq0FOg7mBPBnD/Buz9APdawKEba7fd1LBZN2HWWT6L8ru6djbzZlZVOvPWbYIKhG3
         BU4eZJ7u/aH1z5tS8wb96c+ItPzpKQuMzLgt4XcpGoJ+AlM6OMwZndbEXVHIJFQxm+TG
         HS2elVpcTxP3HP0V9NzG+v2PnYbPktKDzxZFMohM4QvLZ6/cW9H7HQ2jM8DwW2vtm91V
         d2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+7mU6x0kAtNzznIM6tbGCzx9BmVJw914gebmRmVgVcA=;
        b=D6rE81LIPzz+L+0CE1AdRquZRf89sQcSxv9jnKjL0DcJ7rs8j+Xl9ZMeKq02HDeCIV
         mGYcwhI7EOeh83LaCbKllvkMgeCNFyQH9hZpSCl2iXr+Lpz5Y//KS6IZBokbTLsIYV2K
         Itk6RyrQRPx8/0jsIdnaLp3zCS9W//2CU7Kf8yADoAIlR6xxzMW/IInMIP9Lvw2zsOay
         Y+1hNzYP220xkTTEgpN1ZrHQuHisSTs0K5SL5/mS432floTbkNe0njW2QG4qh/wZhg1E
         gmqr8hQ7mECr/JCH6P+gdVoCCE/75QKLcYyXZn4d35I43k7U+q/t7CrToKYmwfOMb/FE
         vNcg==
X-Gm-Message-State: APjAAAVagrJ+n+IyGZ85/6Jzattr4cPDHc+3sk5CQrXQlGINU1QA3wMY
        X1axZWqv1U4/DRlkcxohH+xNQiM5
X-Google-Smtp-Source: APXvYqzJ01QKAXqhYjRzFJkpaImbzq9fBgrlnwuss9AvGR+yjNVevlG9yokk3U3+ulZOCQnkNGkrTA==
X-Received: by 2002:adf:e887:: with SMTP id d7mr22846695wrm.282.1566831453592;
        Mon, 26 Aug 2019 07:57:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Use dma_fence_array for implementing shared dma_resv fences
Date:   Mon, 26 Aug 2019 16:57:22 +0200
Message-Id: <20190826145731.1725-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is the new dma_fence_array based container for shared fences in the dma_resv object.

Advantage of this approach is that you can grab a reference to the current set of shared fences at any time, which allows us to drop the sequence number increment and makes the whole RCU handling much more easier.

Disadvantage is that RCU users now have to grab a reference instead of using the sequence counter. As far as I can see i915 was actually the only driver doing this.

So we optimize for adding more fences instead of reading them now.

Another behavior change worth noting is that the shared fences are now only visible after unlocking the dma_resv object or calling dma_resv_fences_commit() manually.

Please review and/or comment,
Christian.


