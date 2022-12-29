Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CBB6588B2
	for <lists+linux-media@lfdr.de>; Thu, 29 Dec 2022 03:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbiL2CqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Dec 2022 21:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbiL2CqN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Dec 2022 21:46:13 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00144CE0B
        for <linux-media@vger.kernel.org>; Wed, 28 Dec 2022 18:46:10 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n12so5025522pjp.1
        for <linux-media@vger.kernel.org>; Wed, 28 Dec 2022 18:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mmvRXkVVtaqaYs2yoaTeEYQ9ctHUESJNG5qerNoqkcI=;
        b=Ix5ubWHKT4dV/qTkpacuNERdaV/pX2Lv0NSwf2hKn2h50Uafq1sCp8pa7hTFkb0rDY
         MPN8DXuZlTc5LCMp72LnzbnXg++UeykvHnCrDI1pyW/oAhGr6pyoeuZuzJ10o/XDQtF/
         LEFK/9LadKv341M6apxIw7uRxGePY5e4mT/Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmvRXkVVtaqaYs2yoaTeEYQ9ctHUESJNG5qerNoqkcI=;
        b=SScVZuuvy6lGDBdRgU9RGQtzfzys3oPJakdPtQN9hFIasv5mIm90/nUQDj2wqIpX3w
         kiDYfBEujhRZCjJKsTufwnbKUu8yfIQSGmEy4mlP741umrd47jqjuaskjr2zUpgTzFcK
         Tyl0k/VxiZyP9g8hVXhgvT+yhm+tl8Unpz24g6OA0nca1yfl9Ja+zPurbm/MkEg11VWR
         OE/WlKqL55nLNHs6Gn5Ru642F2jtZSfQNs3NC7/CQERlRy254EuAta32i/U2a2HAqQ6T
         lz3j2PgUZt5hDI/MWtFfXiz/gpKIMc6JkCmwJHQ8ev96duAIMO8lLFPFf2zQyWYkTjaY
         Yvlw==
X-Gm-Message-State: AFqh2kqVlndsx5UUePfZt9BbMyRITcZfb0nywKUzTzu0A0ZvoHo/B4TL
        2WMqVeUTxnIbqq2rtiFDrnX/WA==
X-Google-Smtp-Source: AMrXdXtnWdSyX0JgddpSXsDrcnaiUKWgj7lNBDws8U+1KJnJnXqzlQypQYWru2VMcWZWMAQxWFLCXg==
X-Received: by 2002:a17:90a:7443:b0:226:1cd3:163a with SMTP id o3-20020a17090a744300b002261cd3163amr4181143pjk.10.1672281970480;
        Wed, 28 Dec 2022 18:46:10 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090a66cf00b00223ed94759csm12806439pjl.39.2022.12.28.18.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 18:46:09 -0800 (PST)
Date:   Thu, 29 Dec 2022 11:46:05 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Yunke Cao <yunkec@chromium.org>, Max Staudt <mstaudt@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: uvcvideo: Remove void casting for the status
 endpoint
Message-ID: <Y6z/bXckwqvyB5Tv@google.com>
References: <20221214-uvc-status-alloc-v4-0-f8e3e2994ebd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214-uvc-status-alloc-v4-0-f8e3e2994ebd@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/20 23:56), Ricardo Ribalda wrote:
> Make the code more resiliant, by replacing the castings with proper
> structure definitions and using offsetof() instead of open coding the
> location of the data.
> 
> Suggested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
