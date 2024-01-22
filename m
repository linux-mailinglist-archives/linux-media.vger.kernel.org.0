Return-Path: <linux-media+bounces-3964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2930835D25
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 09:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 317F52868E0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 08:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217D23B28F;
	Mon, 22 Jan 2024 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uyQ4HLu0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DEF3B290
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705913247; cv=none; b=j0LxQNesV2JKy7RFw6OOLcOzHxQvsreqnGcCdBvj+pUFxtiSrz/HM7+fDVwy6EH5BJoJPWVR0HB0kMvpPudCDsz7egXIbB7cEi+rSIH8tWNdfeQQQHbXqkeKAHQdeftv96gUbcTLvuPx3lP4k8W4fYHnpeynzyOe1j6Ge/8In8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705913247; c=relaxed/simple;
	bh=9SSOqOK0Lej5rqz0TF7e31lFUOaMw4aoR6sqSlIKxlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KxsYu+IGSUVC/KtATHgibJk31RgszT0hWSxCE5I+ODMriRUz3BU3bxj/wCCxwxVSOakkSRTDp/GwfZqrRC6ziGjcCdtYuQGfcVeeViSlZRSlFWxhKqoi2cy4gjg40xFEPWUzRApeAgnQKEl9MTlY07nAR1deGnJyde0hgEgUYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uyQ4HLu0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2fbb646eb4so183923166b.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 00:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705913244; x=1706518044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+4N5IhDKtfhb9B64JgR/5eRkIAxdmeTyFYBzClQWGo=;
        b=uyQ4HLu0WuqGvzML8f9CmLZWPak/kP5Yaaa0yV4oNL6PS2kcWsybu5zl4EdCqVrA48
         3AToPyjHylqg1+lNMViQRod3z48Ac+WqLXC5FIycRW77dA4mwVZrAzowG4yJgc88a/fb
         z3OsTgm3k1FY2/2SKmX8zXYqKEGptdXYwa1lZKS6RGPUbv7K55tS8knW6078X12BAh5y
         tH/maTfpOcrAiGTBR6ddonzdfyVl9Q5YxYsfb7i5CMdWr6AXLIAJI5ZhEb8SZDgCFY1Z
         KkC7pcloaaWVPBsZekUTA58DPKnT7/ND44UoLQSsAwuozAC+CKBrsfypsAIntzJOvxUq
         RYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705913244; x=1706518044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+4N5IhDKtfhb9B64JgR/5eRkIAxdmeTyFYBzClQWGo=;
        b=eNNWP8fd/vVFq+2dLfpwFFzWrxl8AznOhnr/87bFoD/bi3aoZT0nHHLfkWlMB/z2ZH
         4QJ3d2oP4VrNmyYtykelXQ0hEdyqYMjVs3LRRvv70HybLXQ66vl/e0qa93HfrykzqgC6
         1ruRyQhOhCA2qvbc1PCL15HpaM2XiFAi2jh6Un29CbrTIPfE8OwF/Wci8HKUQQenINBT
         8CL48XXJd+F+Oie4pz2HNA0gJW578Kzh0zdr2MUqtPLKG1SBiJBjD1EEekveIVOhJFqr
         O+LjiRonxHj+uzIzQx3SfeWAGewUA4EcW5PQ4UFyx5ZdCUZy89K1Qu2y3RkWTdA2QPaE
         3WOQ==
X-Gm-Message-State: AOJu0YwaaVXku3Qp8AYHZEXGxCycrFYArnJzFnkIrhavqWLV9nqQgKkq
	ToaUfc+oAmADw8PDPZ+I8jsw7qoRhGtAokJlh1WPzpBHX5nwupGLVVhaZM6BhPs=
X-Google-Smtp-Source: AGHT+IF5jY/odVzvuuX2tsOgaxne++vFuGZaQeGK6pDpveTgnv/VnFvr3/C7wt8hPfuKeQMEomU6Ng==
X-Received: by 2002:a17:906:8302:b0:a30:76b5:fa05 with SMTP id j2-20020a170906830200b00a3076b5fa05mr192533ejx.40.1705913244072;
        Mon, 22 Jan 2024 00:47:24 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090630d500b00a2c4c23cd12sm13075462ejb.217.2024.01.22.00.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:47:23 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 22 Jan 2024 10:47:02 +0200
Subject: [PATCH v4 2/5] PM: domains: Add the domain HW-managed mode to the
 summary
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240122-gdsc-hwctrl-v4-2-9061e8a7aa07@linaro.org>
References: <20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org>
In-Reply-To: <20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-media@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=9SSOqOK0Lej5rqz0TF7e31lFUOaMw4aoR6sqSlIKxlM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlriuQcy6GvAlKv75yWNiL+5SW0RsJUO6/56kgP
 JidJnlZ3WSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZa4rkAAKCRAbX0TJAJUV
 VpP9EADKWrlShjfOHeZMBqfEIYmnGs9ZDExFZPKyfsVQhcKvr6coiF2QWKf6+wuMuqH5iY4nKMx
 nv9qy6yV0iOWi+DwMYZT/PvHti9yebGXkOhah/nOYwhC+6HfZYHCUrfxi7uhKOEaXOJhCHnG4rt
 L/QrICOeo58RbuYwE6DllCq2r6FmkDVFfM+0TQ3c0YBRn0uhmkMU9Yl3utWBZ2ZNwAabi9vqGIw
 VowRsXDLPin8pATypm/WGG1AS77x10VV7n4Du+kDPgrrNU+s0Eog1hk2hxBOcJg/hoysGPevgxM
 s7kbbvrC7+vARF82wj/0S5SwLYQhkMtA6ldpOuURnpCIQwiZQJGXihzLZJ/9kWPSWWU6pLbGu2w
 7SIyTWaTe5Qf3W2XKr8y2l/81KOoeg4eujaB9EaAmQRA2nyE8RYtrgGIloLZeMN1etit0EUw0Bh
 PaZ/vGdLEwbvWr3Qw9bPAhgbraBokx7GxgsVBZjkpR9ak2+bCB87+8IUjVTf+7qZSgoq5s/ePno
 x9y/abt+Ka55T9QC8yHAEKJDJ8MAwF27UJmvs64kAbfmMNBTnBu4YeA5B1rwVZxfn6fNTi1WXV6
 0NvJflRNpfKFiM8657hoHU8h9UCrGJQZpcnNu0rjMP9MtuY1vSAcsa3GnYqkd7YaqCg7O+gp76B
 d3aWRxBJUNxpGHA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Now that genpd supports dynamically switching the control for an
attached device between hardware- and software-mode,  let's add this
information to the genpd summary in debugfs.

Suggested-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 drivers/pmdomain/core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 41b6411d0ef5..841fde9e9f87 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3147,6 +3147,15 @@ static void rtpm_status_str(struct seq_file *s, struct device *dev)
 	seq_printf(s, "%-25s  ", p);
 }
 
+static void mode_status_str(struct seq_file *s, struct device *dev)
+{
+	struct generic_pm_domain_data *gpd_data;
+
+	gpd_data = to_gpd_data(dev->power.subsys_data->domain_data);
+
+	seq_printf(s, "%20s", gpd_data->hw_mode ? "HW" : "SW");
+}
+
 static void perf_status_str(struct seq_file *s, struct device *dev)
 {
 	struct generic_pm_domain_data *gpd_data;
@@ -3205,6 +3214,7 @@ static int genpd_summary_one(struct seq_file *s,
 		seq_printf(s, "\n    %-50s  ", kobj_path);
 		rtpm_status_str(s, pm_data->dev);
 		perf_status_str(s, pm_data->dev);
+		mode_status_str(s, pm_data->dev);
 		kfree(kobj_path);
 	}
 
@@ -3221,8 +3231,8 @@ static int summary_show(struct seq_file *s, void *data)
 	int ret = 0;
 
 	seq_puts(s, "domain                          status          children                           performance\n");
-	seq_puts(s, "    /device                                             runtime status\n");
-	seq_puts(s, "----------------------------------------------------------------------------------------------\n");
+	seq_puts(s, "    /device                                             runtime status                           managed by\n");
+	seq_puts(s, "------------------------------------------------------------------------------------------------------------\n");
 
 	ret = mutex_lock_interruptible(&gpd_list_lock);
 	if (ret)

-- 
2.34.1


