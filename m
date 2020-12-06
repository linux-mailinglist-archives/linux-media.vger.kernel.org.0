Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39482D02C1
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 11:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbgLFK21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 05:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbgLFK21 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 05:28:27 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31631C061A4F
        for <linux-media@vger.kernel.org>; Sun,  6 Dec 2020 02:27:41 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id a16so15208777ejj.5
        for <linux-media@vger.kernel.org>; Sun, 06 Dec 2020 02:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=NwH66bgHlrEHpTO/NKIZC0uociq9PGZvo75fD32tzZE=;
        b=OdaAUzQXlgc+qwL/208iEg5LZec6x2E122qWAju7nqDo9Z1kaBFJ7189MT0A72vp+3
         7jDHocyg0I/ZDIAS8iFKrjbmFRNytwngPXiqjzqQY6Ezz/F1sjXcNbDuHW9KCb+Kpm6X
         bpQYPnRdwdYAGj9xV7TlNElEh4RIlIsBTLX/EiT+S9eD6wONNq1LefnmBGcd/d3+F6vH
         icbXr9YWDjAEg6Pg2EXGR+x3Nu9SFknZu6ATVNswTg0kUJMnA2Jc4EDiCGf/CMiwBnnn
         RkEnoscfh3TbH/WPLojSMdyr+pJMriWjZ4PDM/ILCJc82qcAGqel2OWlIgWQto2Tu6M8
         8NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NwH66bgHlrEHpTO/NKIZC0uociq9PGZvo75fD32tzZE=;
        b=GjrqZeh4P6BDknUgoRn1vfxpDx+xOGNp43XA6ngSdEtqs6eFKGdYIc+ZxeK0lvXNsV
         5eSBXI+gW/NCCanHD3wETen6kqMQ5BjxIZm1QplF6ZJMj3s5iwO7c7URk1exNBIfgMOx
         YVBrPOgmBHsfw/BlUaCmISsXeP5LAqk+0yYAUrcqPa5Fgj1cQUcbsKhfwAhmEA4sQqUn
         Ry5yjDDsTCz50M7nWPVvLHXYzEW/4tJ9FQLRXp15u2OlBAshlw7Fy62gGWZ80SacbBEs
         7CNB5BTDkEYKJzVXW4EBjC6wdlk/gJyBCFoObTspsPNU6xJw1j+vGh5GK/7lI4fezLLb
         VYdw==
X-Gm-Message-State: AOAM533/286Apmd56IPobrxqSNrPqiMRWeIB0LFluS9EIARLGT3H5eEx
        /7KHzbH2F1mePbd7rHi7tfBHIrU+MNrs0kUR
X-Google-Smtp-Source: ABdhPJwACbINJCpXWPzrBnGbAhLhrNAaPGVjOOmwRH51RmbJOgZSLJ5Q/XJmh1Liv04I4Ws7pL/+/g==
X-Received: by 2002:a17:906:2612:: with SMTP id h18mr14871737ejc.469.1607250459651;
        Sun, 06 Dec 2020 02:27:39 -0800 (PST)
Received: from localhost.localdomain (hst-221-17.medicom.bg. [84.238.221.17])
        by smtp.gmail.com with ESMTPSA id d4sm8464736edq.36.2020.12.06.02.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 02:27:38 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/4] Add random IR and AUD encoder controls
Date:   Sun,  6 Dec 2020 12:27:13 +0200
Message-Id: <20201206102717.19000-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The changes in the second version of the series are:
 * change the sematics of the random intra-refresh control to
   intra-refresh period, see 1/1 for more info. 
 * incorporate review comments for AUD NALU control (Hans)

regards,
Stan

Stanimir Varbanov (4):
  media: v4l2-ctrls: Add intra-refresh period control
  venus: venc: Add support for intra-refresh period
  media: v4l2-ctrls: Add control for AUD generation
  venus: venc: Add support for AUD NALU control

 .../media/v4l/ext-ctrls-codec.rst             | 16 +++++++
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/venc.c      | 42 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 15 ++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 ++
 include/uapi/linux/v4l2-controls.h            |  2 +
 6 files changed, 80 insertions(+), 1 deletion(-)

-- 
2.17.1

