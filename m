Return-Path: <linux-media+bounces-3252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2795682577D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 17:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4327285188
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 16:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C2F328D5;
	Fri,  5 Jan 2024 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJlfLXum"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE08328A7
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso2201666e87.1
        for <linux-media@vger.kernel.org>; Fri, 05 Jan 2024 08:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470469; x=1705075269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38V7OcbMS6BvfR/Kfa+Il7csYOikckmVIMPsPO2mrzc=;
        b=fJlfLXumnbjgA414C++MQNqKxdkH44NbYoSiS9Z5CAyw+quyTvGAetTALDY9ma58At
         1fLn6ZTPqKpmW3NC8CqORI1Lm2kw86STv6u2xFQNLw/lRzLn3a6v1TB3DFGv3rcKN+cL
         4psuVWg4ouN3acZzD0E5Z77Dkx0AHZpmXa27ek4+P2zxCH2MnTH1QeGUbvCH0PnMeZb+
         DSgbGO+57vpTY6KdAkYHLVt9mvLJq6rnXPzH2LLGh3xlyeygmGCZeXOODFdkVV8iH8w9
         ptwjvbqfU5Qux2qbobg/KQoBZ9/ZsFJAAT7mdesYEfUIxEeL9CkQdyqYr7JPv5uoIt5G
         PLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470469; x=1705075269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38V7OcbMS6BvfR/Kfa+Il7csYOikckmVIMPsPO2mrzc=;
        b=Fk2JYHfZtzwn4HaTSlDnwty5+t+Xny/f8BEWPvapn8ZNBxDBHms2BaEwVsUnvlsxbk
         LOxoLpo/l17pdfhpGvOq0x5ka8LHR1PRLX1grMxBsneqvOIPWBk3YMJ1qrkkE3xR9aad
         QzWG+1xxk9n/p0A2/B0/wA7Rm5wGR3JeNZkRpx6ENhcESnce8TC4nBhiKsE7YUq+yPx9
         Cz0vuyHbPqUB8Z66BmwJMXiJYHNk0GnRvBeht8Sh7MNBY2LS085HwHQoZKYyaxYo9stc
         4iW1/VSKFh4Rb785VHxlEjWLuu3ubt7ZqFln90PMQ99dqgEJGhijobu8BD7s5GCho33u
         zs6Q==
X-Gm-Message-State: AOJu0Yw/Eqzi36X9S8+N8pNk+qcytZ1cfTU5cSZe6WeqW2oh1pzut0J9
	7aKx0PD2jmApRGYxWtZ+Aoop5iyEwrfYEg==
X-Google-Smtp-Source: AGHT+IFh9YVPZuE9tKS0AFwt3Ec/+vDaZEOHyXj2dDkN6g3GOJ4V2yIMVU7V8xUNC8GjeZWedVH3Zw==
X-Received: by 2002:a05:6512:2315:b0:50e:6ec3:6a42 with SMTP id o21-20020a056512231500b0050e6ec36a42mr1573154lfu.126.1704470469081;
        Fri, 05 Jan 2024 08:01:09 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id n5-20020a056512310500b0050e76978861sm262094lfb.277.2024.01.05.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 08:01:08 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kevin Hilman <khilman@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Ben Horgan <Ben.Horgan@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] PM: domains: Add helpers for multi PM domains to avoid open-coding
Date: Fri,  5 Jan 2024 17:00:58 +0100
Message-Id: <20240105160103.183092-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates in v2:
	- Ccing Daniel Baluta and Iuliana Prodan the NXP remoteproc patches to
	requests help with testing.
	- Fixed NULL pointer bug in patch1, pointed out by Nikunj.
	- Added some tested/reviewed-by tags.


Attaching/detaching of a device to multiple PM domains has started to become a
common operation for many drivers, typically during ->probe() and ->remove().
In most cases, this has lead to lots of boilerplate code in the drivers.

This series adds a pair of helper functions to manage the attach/detach of a
device to its multiple PM domains. Moreover, a couple of drivers have been
converted to use the new helpers as a proof of concept.

Note 1)
The changes in the drivers have only been compile tested, while the helpers
have been tested along with a couple of local dummy drivers that I have hacked
up to model both genpd providers and genpd consumers.

Note 2)
I was struggling to make up mind if we should have a separate helper to attach
all available power-domains described in DT, rather than providing "NULL" to the
dev_pm_domain_attach_list(). I decided not to, but please let me know if you
prefer the other option.

Note 3)
For OPP integration, as a follow up I am striving to make the
dev_pm_opp_attach_genpd() redundant. Instead I think we should move towards
using dev_pm_opp_set_config()->_opp_set_required_devs(), which would allow us to
use the helpers that $subject series is adding.

Kind regards
Ulf Hansson


Ulf Hansson (5):
  PM: domains: Add helper functions to attach/detach multiple PM domains
  remoteproc: imx_dsp_rproc: Convert to
    dev_pm_domain_attach|detach_list()
  remoteproc: imx_rproc: Convert to dev_pm_domain_attach|detach_list()
  remoteproc: qcom_q6v5_adsp: Convert to
    dev_pm_domain_attach|detach_list()
  media: venus: Convert to dev_pm_domain_attach|detach_list() for vcodec

 drivers/base/power/common.c                   | 134 +++++++++++++++
 drivers/media/platform/qcom/venus/core.c      |  12 +-
 drivers/media/platform/qcom/venus/core.h      |   7 +-
 .../media/platform/qcom/venus/pm_helpers.c    |  48 ++----
 drivers/remoteproc/imx_dsp_rproc.c            |  82 +--------
 drivers/remoteproc/imx_rproc.c                |  73 +-------
 drivers/remoteproc/qcom_q6v5_adsp.c           | 160 ++++++++----------
 include/linux/pm_domain.h                     |  38 +++++
 8 files changed, 289 insertions(+), 265 deletions(-)

-- 
2.34.1

