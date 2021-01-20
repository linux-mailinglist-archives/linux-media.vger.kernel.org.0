Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E452FCE5B
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733207AbhATKiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:38:03 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:37355 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731640AbhATJnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:43:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A19l8jEb; Wed, 20 Jan 2021 10:43:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135791; bh=CKIGfhq1KWOmGl6UjN6qnlcI8sCmeEHWOWE2stnPNWM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=QHU95PRBy6fYt4ksYfvC2rzv47gn9kGgYJetQI1THLooJrn2zb1FbaauJcEHxM06Q
         FH0WAe04xpCGb2Gc5QqJKgopk5sl0ZeO5AXyyXSm5Vy0uMPLQRLos0U6sUaihWrePe
         nJJoVnkxxCP9GvkFyr5V+cTjMPvRSSOdbt3mJgFNmovi/Eyx/t6AVr8hwtKOFAqT74
         4Fdtunz7Y8pI2MscLN3XF/R9jjKU1JmTnGiymqA34/eYKu4HJ+heg67+WwJB+Qfzeg
         +9Lho/fRg3kL52lHrvCQcR8gi262e23rMrU2IQ+Jwe8KZhoLIrexfRS11mWMOfHwAA
         GJqrdf6YOSNCw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 05/14] tuners/it913x.c: fix missing error code
Date:   Wed, 20 Jan 2021 10:42:57 +0100
Message-Id: <20210120094306.784318-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfL6gXyIQamfwxJt2kYKZXIXPfvD+J+cb4hNqS4nbZzw1GI5vvllDlxOUWgqraiFNhq3F/LZtBzfudYa84HR768+XzVha/eeTgmB7xn3J2//BbfAk1A8s
 5K51t7mq0GZhhQ49J7CLA+RHjKt5Hf37i+bOtd1gdl67I4sW94CZUKZ7oKlpPPXv1ea/7JeAdQ5LUW/5vUTX2byGUDAugDmGCw5EWS8w0pd7OAxiojkwR3Kr
 4pB9lnSLupHvBjX2nym/AA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this smatch warning:

drivers/media/tuners/it913x.c:65 it913x_init() warn: missing error code 'ret'

Set ret to -EINVAL if the clock identifier was invalid.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/tuners/it913x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/tuners/it913x.c b/drivers/media/tuners/it913x.c
index e8e66390be41..7696a28fe407 100644
--- a/drivers/media/tuners/it913x.c
+++ b/drivers/media/tuners/it913x.c
@@ -62,6 +62,7 @@ static int it913x_init(struct dvb_frontend *fe)
 		break;
 	default:
 		dev_err(&pdev->dev, "unknown clock identifier %d\n", utmp);
+		ret = -EINVAL;
 		goto err;
 	}
 
-- 
2.29.2

