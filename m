Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33C92DD7BA
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgLQSMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730762AbgLQSJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:00 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDCBC0619E3;
        Thu, 17 Dec 2020 10:07:59 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id o17so56903129lfg.4;
        Thu, 17 Dec 2020 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KswnK2pgrRw2QhZvB/Use4T7bnltjrNj3eLqWqZME28=;
        b=mhiowlBu7ET0N7ZefbXZKe0CF67YMU9S7y4YnHN8AKhj9s+K5Q308qgF56a33giJy1
         2Fr67/ffjz5Qb2QcopQwJ25hdtsHN2y4ysAlnDh+m38HGkk4tbkttwhclxEN3nXOkVZa
         d3l+w/smldQi/xnydW0v7hAlsL3c4c8tWuqVTNzv87bvmWX3drPVnj3Ijn5IWHHKppzK
         co2En3pXyzyTWa+PrC+QSFAyn3yy2Y0YIDa+mecXU7ZlSClJTqx77dveS49A+Uyd4Jkm
         bFtyJ4s1bqSumabh4r7n6k6wE8+jJqhgzd7qrY4Vq5HGMI9zgWz6GAYDMwKf0RqFvSFS
         8KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KswnK2pgrRw2QhZvB/Use4T7bnltjrNj3eLqWqZME28=;
        b=kVY6y3qeSop4sSM/6Iptyj+yAIsrAsfc7lP9zJAcGGRAys7zIDsARi1RoP3fzL2YAk
         riKP2QtmvL1xiwtGRywDw8TILLk2sJTCw1zv4VW1G3T4o0fSwXrQgn8VV+UdZ8UN7ABp
         fnH+bGofs8zlpOs01CCdCuskMvqas/VcJtcclhxtQa2W+NJA/Nsg61wRWsxNK5x++8el
         RMEAqX/Y/yw/KNq0twbOGQVLuPDUurrlcUbKVZReIH8ru6sNIQXgkDF2m+xdpeJx7x4V
         LmAyIpgrG0qdO4x83Dsb596hD7pOS4R5ZVxQlBf8ebshg2Kp9cE7b9RlPGo+V/cIm4Ta
         aAyA==
X-Gm-Message-State: AOAM53004qX3wWDC0Cc0z4R15gsrpLvBVJAqLyq7ynn9RpL/46WyqYQn
        7mYco5wnkorjvz3vn7xiaI4=
X-Google-Smtp-Source: ABdhPJyuCr3Uz6wXHF/lbttUt7A2z6j3C/VIP45WsYuNIaAuGMcBlIRrrIe5fhI+HWJqsB4/YZ1NfA==
X-Received: by 2002:a19:904:: with SMTP id 4mr2339lfj.64.1608228478227;
        Thu, 17 Dec 2020 10:07:58 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:57 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 33/48] gpu: host1x: Add host1x_channel_stop()
Date:   Thu, 17 Dec 2020 21:06:23 +0300
Message-Id: <20201217180638.22748-34-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add host1x_channel_stop() which waits till channel becomes idle and then
stops the channel hardware. This is needed for supporting suspend/resume
by host1x drivers since the hardware state is lost after power-gating,
thus the channel needs to be stopped before entering into suspend.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/channel.c | 8 ++++++++
 include/linux/host1x.h       | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 4cd212bb570d..2a9a3a8d5931 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -75,6 +75,14 @@ struct host1x_channel *host1x_channel_get_index(struct host1x *host,
 	return ch;
 }
 
+void host1x_channel_stop(struct host1x_channel *channel)
+{
+	struct host1x *host = dev_get_drvdata(channel->dev->parent);
+
+	host1x_hw_cdma_stop(host, &channel->cdma);
+}
+EXPORT_SYMBOL(host1x_channel_stop);
+
 static void release_channel(struct kref *kref)
 {
 	struct host1x_channel *channel =
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index ce59a6a6a008..565833689be2 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -167,6 +167,7 @@ struct host1x_job;
 
 struct host1x_channel *host1x_channel_request(struct host1x_client *client);
 struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
+void host1x_channel_stop(struct host1x_channel *channel);
 void host1x_channel_put(struct host1x_channel *channel);
 int host1x_job_submit(struct host1x_job *job);
 
-- 
2.29.2

