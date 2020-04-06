Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D24A319F0C4
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 09:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgDFHah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 03:30:37 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46427 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgDFHah (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 03:30:37 -0400
Received: by mail-pf1-f196.google.com with SMTP id q3so7098103pff.13
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aYyDu5xo6XXrzmH4tjf4pOWN9FZQnxXMDt3z3mrVzPg=;
        b=NUpweMU/2ZWQ9Wf1b7JP0hf2isQFuhhbak5HRJIE6E8VZ7TTj/FeVgi2ELgHqmWeFr
         OzzfW6wEUmReg7E0Ivtn0qyYKx7ZtoIgmDJyh8Sm5ZrbLY1weWeRpW5GDAgECiypAKhY
         PTJA6A89ThKZTwdhwvRpWWXSjCAcQPxyeUVxQjJZvR+y4s+s8wOB6bVZGiYT2etxF8jW
         F+YrNf08is18Hx3Uacs/Nw4GqQ/BAsE9ZU2tTJlfFNe3+II0TrX5jtoF2qmxediT7aNP
         EoRHgVmuH5mw8/NsNupb1knetL5WbrmT2hJgztrBG7mYu3ymLZ99GNcDmGu5sfoOGDNk
         QBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aYyDu5xo6XXrzmH4tjf4pOWN9FZQnxXMDt3z3mrVzPg=;
        b=Uknyh7oWtgjyMzF4eiiaTYS+iYTWfy4BPI2OX6zLxV1c62PCuJHHhZicpYth2vPZGc
         PE0tVQbuUdx58WkwmYtDRh2EfS6JA45OPXQmauAKn/DEkk8/hlHtZDRewxsIVAgWPzDj
         KOecsvDh77kKbtL2W4RhGhVJ4BBT/tCGrMMgX8ojDyeQCrJIgU4uezOSu5e0w/TAqYeY
         PoZtG9b+I6wrzs11tf4jZmOnCJHmcAr4VdnFbsW6ZHJ5dfHc6AH10TvXc00sHErF9uHk
         0Nr7O/m8v/wsYElo2qm6g04h4FWUVgIM1jYoXELg0E9A1OGaiNQTZVQ/AVsH2uoLnU7Y
         V8Tg==
X-Gm-Message-State: AGi0PubJaiYriyl0D5ggfctEWwq0UBE/kQWGUX9l/2FcYAiePbaoueJF
        2hl4nSWYSReHpqmWsMET/dBwxm9M
X-Google-Smtp-Source: APiQypLjWvcGpnQl7cXxtZskVM+8ZJK/vn7B88fH/6dAgvpPIs12SnhxmXaECqH8S02ItujFN8C9Nw==
X-Received: by 2002:a63:7a07:: with SMTP id v7mr10154205pgc.302.1586158235086;
        Mon, 06 Apr 2020 00:30:35 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-174-82.hsd1.ca.comcast.net. [24.4.174.82])
        by smtp.googlemail.com with ESMTPSA id z6sm10170179pgg.39.2020.04.06.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 00:30:34 -0700 (PDT)
From:   Karthik Poduval <karthik.poduval@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Karthik Poduval <karthik.poduval@gmail.com>
Subject: [PATCH v2 0/3] Add Rockchip RK3288 support
Date:   Mon,  6 Apr 2020 00:30:14 -0700
Message-Id: <20200406073017.19462-1-karthik.poduval@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <karthik.poduval@gmail.com>
References: <karthik.poduval@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here are the series of patches adding Rockchip RK3288 chipset support to the
Rockchip ISP1 driver and Rockchip MIPI DPHY RX0 driver. These patches have been
worked by referring to tinkerbaord debian kernel posted at:-
https://github.com/TinkerBoard/debian_kernel.git

They have been tested on the tinkerbaord using a ov5647 camera
Example test command (libcamera test tool):
cam -c 1 -C -F cap

Some modifications were required to the ov5647 driver to make it work with
libcamera which were derived from git://gitlab.collabora.com/koike/linux.git
rockchip/isp/v12 branch.

Those ov5647 driver changes are not a part of this patch series.

Karthik Poduval (3):
  media: staging: phy-rockchip-dphy-rx0: add rk3288 support to DPHY
    driver
  media: staging: rkisp1: add rk3288 support
  ARM: dts: rockchip: add rk3288 ISP and DPHY

 arch/arm/boot/dts/rk3288.dtsi                 | 25 +++++++
 .../bindings/phy/rockchip-mipi-dphy-rx0.yaml  |  1 +
 .../phy-rockchip-dphy-rx0.c                   | 69 +++++++++++++++++++
 .../bindings/media/rockchip-isp1.yaml         |  1 +
 drivers/staging/media/rkisp1/rkisp1-dev.c     | 18 +++++
 5 files changed, 114 insertions(+)

-- 
2.17.1

