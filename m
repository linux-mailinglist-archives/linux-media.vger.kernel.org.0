Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDA9B9F12
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 19:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407842AbfIUREC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Sep 2019 13:04:02 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32977 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406192AbfIUREC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Sep 2019 13:04:02 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so9802847wrs.0;
        Sat, 21 Sep 2019 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=55amjIu2TF3CCD9dfZQ7gR+oWC1rkKKs0l26DxHMq2I=;
        b=ux3fQc910IEW3PhTVTjkp+MKFpIHLHjhin61mmPdzaqD9j6z9Bh1v+6QQIXhqsn8V8
         vVfT0zEhnayS+nlKVow11xrXEVvHHaOoIYgkv8AtvQxY3lmoQfBeBb5JiJdi8VyPToTs
         NLuqLWTcx2RzwPnzxqQLXxG0IMIm5org8JvP4E7mNyF9PqH1roOYKkWrcqcdQJqnc7qC
         ufHm0YBE23Z2ijPma0C33C6dO3u9XbnhjtvuoOGEjl0outphR/3WsHkHiy1NDb3QG/Mz
         40zZlD5ILulJelu3ipm5lWBQq8oPrUvBdrfdzIlPjhMp9yFomWqEAHOb+UVp1PfkgfiX
         hMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=55amjIu2TF3CCD9dfZQ7gR+oWC1rkKKs0l26DxHMq2I=;
        b=ogHo4SrgaMV6B8OgeUYqKDmcAoKfuA2BWSkF73Eujm6B0HroP2ptgY4fbdWKHyAC8D
         XLUl+3X+rBcMpG8G9Xamp/o9e5an6iND3cSO5QYj4af7bXs+u/dV3fePdX8tYP2UiOrW
         8AsmZceI+tXcNyScx7bBZD0wOkDqp5I2rlNit6NIVSl5GkOJbk9Rml5cdHfRPWdnZ/5S
         AzpeEj366dGF/30kRTRPGoKGZkuxCHGV6T+ODhfv0S2gxHETDRAqJ4iXyCJ+pVC0GQSk
         jjEN99Aje4bVfvxqOTLpdfNMVUaxBGxyXT3QI5z7asxH/zRLH/IqjwSt5BFHHP3l/L1U
         1fTw==
X-Gm-Message-State: APjAAAULq3IfaH1nLc9+1lCs6kC3J+11Klr880JVjUbtiAiLPnu3Q6vz
        aauGHdpwwpa150haGwvRG7LOmKF0
X-Google-Smtp-Source: APXvYqxFL84KLpSZMc5/N059+0hlyRMOj1E0IZ+6Y7dGH/TmX232EhUn0HdzjZ8RYcOqvPmaKLSWRw==
X-Received: by 2002:adf:de08:: with SMTP id b8mr14928562wrm.200.1569085439582;
        Sat, 21 Sep 2019 10:03:59 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id t14sm5136519wrs.6.2019.09.21.10.03.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 10:03:59 -0700 (PDT)
Date:   Sat, 21 Sep 2019 19:03:57 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org
Subject: bringing back media/zoran driver
Message-ID: <20190921170357.GA26626@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hello

I am the owner of a zoran based DC10+ card.
I am in the need of using it since yesterday and I found that its driver was removed.

Reverting the removing patch made to a temporary working situation.

If I understand correctly, it was removed due to lack of vb2 convertion.
If I am able to do this vb2 conversion, does bring it back in mainline will be posssible ?
In that case I am ready to assume to be the maintainer if needed.

Regards
