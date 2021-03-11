Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF499337BDD
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhCKSKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhCKSKG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:06 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E820C061761
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:06 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id u4so4197543edv.9
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qa4VJOH7edLfgrfvR8OaRVl2g9iMvgF1hLjXeKfPqA4=;
        b=U/jGIF63pHPQlTFqvJpaJD7y9g+zXOMxUTmCLDoTDyWdGD5ahnTKhiB0+yP1TPeGqH
         Y3icOkQRASyeOTj2NZ+XfONHMstpPOJ8mN4ydGBu/TpdiuNgyzsKeNcUXMqwsd7YiLse
         2geJarY3Nr+Ph0PCxWmwKjoSHqE8CpQEHdy4dw17QFpaMzKxlgHS4kK5UVqQ8j9eapwU
         5NE8BdQ6SJSzkdbBHotU8Bx5Btuy6qelmhRaJ5gSv8D+5hjrMPc/R39OoW5JYJoyVfa9
         qIbuLHliGA48AfXB8A1lDZRvC7CDnxrSyffrzWp9RhEDfeYmI02kgOH+hMsIW5xDppHq
         z+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qa4VJOH7edLfgrfvR8OaRVl2g9iMvgF1hLjXeKfPqA4=;
        b=dVgMaYdJvD2/gTWg3OK2YaelKxntc5jl02xC1mjY7Jv+b0q19IKPR94jAjTlWaGTMK
         mCMrIIgIxLWstIgQOFMWUDHjiw621qqNNsGi5GA46w7no1ZD08n5J1LGKFZ12nIY+tZx
         AdTPMeR6ozLRlSJsZ9g0p5v0zNDAH39P5RI34HQAoCPCKzB4nAZuZh510HpfDUuzmSg8
         3ycUPi/GBlWVhcbLfcQjhK0plAYFIKdRpvybkLrdcZG7+nHHcHx41/GIIWsOMMf9pyGN
         4b4iAZ/jrkmYXhGxu4Pau3hzX1wteKvrzZls6zej+wg25jsc/DkBljXx2u57+YpDJDjQ
         4miQ==
X-Gm-Message-State: AOAM533lsJme+nsrKtuKdwN6NegwCCwan+DTZw/0m9EVDF1Mkv2f6Vaf
        Tjz/J4cE8VSbCQp8MRdNHqBwpQ==
X-Google-Smtp-Source: ABdhPJxQYlVKZoxoNhRG//Zv4/sGy/BTCwUuDVISE+v2ISlgRpQDIPd0dUHftdLOu+MiBlqu4EAsqg==
X-Received: by 2002:a05:6402:104c:: with SMTP id e12mr9544330edu.108.1615486205083;
        Thu, 11 Mar 2021 10:10:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:04 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v7 04/22] media: camss: Add CAMSS_845 camss version
Date:   Thu, 11 Mar 2021 19:09:30 +0100
Message-Id: <20210311180948.268343-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add enum representing the SDM845 SOC, which incorporates version
170 of the Titan architecture ISP.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---

Changes since v5:
 - Andrey: Add r-b


 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index e29466d07ad2..63b35ea2ca36 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -66,6 +66,7 @@ enum camss_version {
 	CAMSS_8x16,
 	CAMSS_8x96,
 	CAMSS_660,
+	CAMSS_845,
 };
 
 struct camss {
-- 
2.27.0

