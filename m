Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E86AE5FC29
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 19:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfGDRE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 13:04:27 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37124 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfGDRE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 13:04:27 -0400
Received: by mail-lf1-f67.google.com with SMTP id c9so2906404lfh.4
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2019 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=CkgDdHVaxcb9rT/2SredJkmJsQ+Tw2cxRbLdVs3ZeiA=;
        b=EkpZ6CWGQaSkDtpNkWc7nrNsvAwSQkc2dO5ImphTS+aQsDRNZolMBeZOVh3qGTPyrh
         hgWP7oT7ncgYt0y0JrnOI6Jzdk7OVEZiCRugORmj+zNXklvb8nVVGACdlE7f7xHtNcr5
         NHb2XdBo4D4M5WFOmlQmnRjMgdej5qAxUyE7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=CkgDdHVaxcb9rT/2SredJkmJsQ+Tw2cxRbLdVs3ZeiA=;
        b=PQl4jlrejuHx9ptlKRY5WZaU8I+FU29vjtWFIjMjhmHfhpmUu9nCaYZyrziPY1RUs8
         1wosLrPaWOJODcK0o5DBr3cYJmoFFytjAPFsXHTXvVugkRZLLMtp88dnBQ7DoFH+QSVX
         iApIsbYMLP2N5mtNN1WpUmZnmwdHn5sg9rizlTuemF6912ebjKgvijlwoVRARvqD8OXS
         s5xTLEgkBqVA7SOSngV7LvdbqcHF75yuGOA+BgdyDLNv82fH6T3nftGsJ5pS7OFIWiLY
         mFm1/5celmM9BBomWnh0L9GtFOwUVygsZ5eASHx4J6jI1fKzYcjFMiFH3mwTXYWL2YLN
         9oHw==
X-Gm-Message-State: APjAAAVBq9knmDSAAsVPRz42xqnT3sMqC1ynazC8Vh9FkQ1Dr9JatZFb
        ZREpLYXjyq8j5mS3UZxWQajM+5EKtu8=
X-Google-Smtp-Source: APXvYqyM1tPH60GaHk8KC0Ui0lZkB72TvGONCHNi4u7bt8iK1WTP4DnC3OKxHSeGvK1pepNKRfKHWg==
X-Received: by 2002:a19:9104:: with SMTP id t4mr5013803lfd.179.1562259865614;
        Thu, 04 Jul 2019 10:04:25 -0700 (PDT)
Received: from luke-XPS-13 (77-255-206-190.adsl.inetia.pl. [77.255.206.190])
        by smtp.gmail.com with ESMTPSA id g4sm985530lfb.31.2019.07.04.10.04.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 10:04:25 -0700 (PDT)
Date:   Thu, 4 Jul 2019 10:04:22 -0700
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentee, PATCH] media: dvb_frontend.h: Fix shifting
 signed 32-bit value problem
Message-ID: <20190704170422.GA25633@luke-XPS-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix DVBFE_ALGO_RECOVERY and DVBFE_ALGO_SEARCH_ERROR to use U cast which
fixes undefined behavior error by certain compilers. 

Signed-off-by: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
---
 include/media/dvb_frontend.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index f05cd7b94a2c..472fe5871d94 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -144,7 +144,7 @@ enum dvbfe_algo {
 	DVBFE_ALGO_HW			= (1 <<  0),
 	DVBFE_ALGO_SW			= (1 <<  1),
 	DVBFE_ALGO_CUSTOM		= (1 <<  2),
-	DVBFE_ALGO_RECOVERY		= (1 << 31)
+	DVBFE_ALGO_RECOVERY		= (1U << 31)
 };
 
 /**
@@ -175,7 +175,7 @@ enum dvbfe_search {
 	DVBFE_ALGO_SEARCH_FAILED	= (1 <<  2),
 	DVBFE_ALGO_SEARCH_INVALID	= (1 <<  3),
 	DVBFE_ALGO_SEARCH_AGAIN		= (1 <<  4),
-	DVBFE_ALGO_SEARCH_ERROR		= (1 << 31),
+	DVBFE_ALGO_SEARCH_ERROR		= (1U << 31),
 };
 
 /**
-- 
2.20.1

