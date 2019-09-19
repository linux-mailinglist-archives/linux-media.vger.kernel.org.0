Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC0A1B7A3D
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 15:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732306AbfISNOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 09:14:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41158 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732209AbfISNOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 09:14:06 -0400
Received: by mail-wr1-f67.google.com with SMTP id h7so3034618wrw.8
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sUQ0MapueTEkl2RraQH96DId2uC2BHxqOglzNZ05qbU=;
        b=RIXIsp5SbQ3+1FciOZcMncizsA+ewMvNJeze7GlP+XW1d2Q6YpaKUG3LZqAFDj8t4F
         AjXkuIaKE0Rn5lD3N4ryyJVZ8zmHXezxJthwldyAqlbfOscXLa0ctazTS13HBSTn3KUI
         Bv6ZPGWw9B0EEbsbOlQCoyYymNCDAbfQRKIPCJwSegqwlD9dL9DHHBUqspdUP7yR0DqZ
         wOlOLE6ilIgA6Ag2ahWfbUk9Kfr6QEZRNS68cUPuKqYKYx4leIXjAhnIgMV2udghOhjA
         1Njvt1P8sPpdQjKrgF3Ragu4Qli6RRgeqTvBOX7u2B6v5f6ZcXWnbMaNd1g4Fbpgw5HR
         lhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sUQ0MapueTEkl2RraQH96DId2uC2BHxqOglzNZ05qbU=;
        b=iTTm0GMZoCblASZPZO/cxodivtfB1yk9XXd0sdJ3C4GWA6o4AMXZbLDV330nf8i/e5
         1JMS7FrpE2RMtmAjoqF7HEZkWvxZtxPwoxibRNztbmGDjUX8SVV4O66Pr52P1L2DJMVZ
         sL5nO8Co22LZ08Nlkd1eMob4GAMfbKXt/i66qbiRg7s23vQTJ+FtUSvs4noNQkAP9q7n
         bf9gu5vqYBqxfCSn1kgY3MSJhAZLZDmpkYD94fffuzq7N9FbV3UlMWc4Vdtzteg/pmV9
         ti3zNnAjL/4pVF/8DCHOp5Qdg5WkYycQzCpwMR0e4Z7Sn6xGF11RjANic3G8hbelZJ1H
         CcjA==
X-Gm-Message-State: APjAAAV4kUqbgIw+O8h+6Qw+0j+lpFuDEDf3+ChU8cm9fzvt/VG4II12
        2ZBMApH2x3/Bum/OxgfHUvHPXSOcfzY=
X-Google-Smtp-Source: APXvYqxkjXgAU4c55QNob8iluQVTDfgvNBvoDuSalGI0xWFWTwwUyixwiDDmT71lOikf1GxJae8Cwg==
X-Received: by 2002:adf:f64f:: with SMTP id x15mr7301613wrp.25.1568898844075;
        Thu, 19 Sep 2019 06:14:04 -0700 (PDT)
Received: from pretoriano-kubuntu.fritz.box ([79.114.202.215])
        by smtp.googlemail.com with ESMTPSA id y14sm13676936wrd.84.2019.09.19.06.14.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 06:14:03 -0700 (PDT)
From:   Flavius Georgescu <pretoriano.mp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: rc: Add support for another 0xffdc device
Date:   Thu, 19 Sep 2019 16:13:36 +0300
Message-Id: <20190919131336.4844-1-pretoriano.mp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190914224059.2789-1-viusflag@libero.it>
References: <20190914224059.2789-1-viusflag@libero.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 Please igonore this patch,due to some dumb mistakes and to avoid confusion ,
 i will re-send the patch as a new thread.I apologize for any inconvenience!

