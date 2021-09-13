Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1187240826E
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 02:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbhIMAwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 20:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbhIMAwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 20:52:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF6CC061574
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 17:51:08 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id gp20-20020a17090adf1400b00196b761920aso5263977pjb.3
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 17:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version;
        bh=kLuWHR7bCOYKQxk1fDmFlW98MF7qGE+UvsNoqzvqNGs=;
        b=ebD3XSBcw5QKoHyE8DSbOeSztymAP+xL0nFaYZESwOdyTyKko3FDr/+0FiDe1DhTMz
         5WxD55kiS4n5bRnsxosGqxKg4AQXhN0l7etDvarhiGKPU2hLjMd0h10mBBwFZ9BwqsS4
         0yX1GIUEonqWN9hCTN0t6cM5sM8Si2E9wMwBliVkkvFbU3wsBKXpDJqK6SZNRb8tZG1x
         wsfJYYKVcnJ4aWoaJYgK/UiNaJYI+2n/Tq3kQptfH0LKneKPOoi3KviDadNtPjhOoGRv
         HRI1pNPwVCaXN9EQsbOeAEZDv4gUhTIIXS0Twq0hKU98hfmsgXWBgx8O5PJ73ay8uOFt
         nfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version;
        bh=kLuWHR7bCOYKQxk1fDmFlW98MF7qGE+UvsNoqzvqNGs=;
        b=hEctQmNccjnI6yZuiQdtOsclvQSkFYtPmRPFxASaITxdxSFwLyizAtRUJi5+2YiQM6
         GWkgjGuO5IWB8WAqbi/6TCzBHPksN21gW8fKab2RC8vJwZ0XtfsPrXa1/exSpa7nAsRK
         amX3rUBZjLJ2BjOA5JwabUcEegGSEfc7Pl6CEmaBOkDS34Oe3XwSIPPDldRmd/nZ/m5J
         cJQNI4sZj7FtyJnFv3Y5mkmU47HaEvBg6LhaT34QFm22aArBAD86c+juiz8XEzWLOH6e
         HIjPxIH5ANBcvxnl6NklIZNz8CrEjB175eIKYY4xx7S0bK8iYIqz7NSm/9MWiNmsxRin
         A39w==
X-Gm-Message-State: AOAM532ES7y9iAxwMhFjz/Ph4vnE/EX3pc+1fGyQuzDPxlKTkNEHIW8L
        yw7YoLalKoynxmF+Ptu5yDcjGOB1waE=
X-Google-Smtp-Source: ABdhPJw4WLRXctnjRzEFn2WzUDSXB5eXHA5vQG8XbEz2fApV7xdbcXElJKzFwtbf3C6E26AWURXxrQ==
X-Received: by 2002:a17:902:be0f:b0:13a:95e:a51 with SMTP id r15-20020a170902be0f00b0013a095e0a51mr8103923pls.44.1631494268236;
        Sun, 12 Sep 2021 17:51:08 -0700 (PDT)
Received: from darkskies.za.net ([2601:647:5a00:8f4:1e4b:d6ff:feba:b9ef])
        by smtp.gmail.com with ESMTPSA id t15sm5735988pgi.80.2021.09.12.17.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 17:51:07 -0700 (PDT)
Sender: Norman Rasmussen <normanr@gmail.com>
Received: from norman (helo=localhost)
        by darkskies.za.net with local-esmtp (Exim 4.94.2)
        (envelope-from <norman@rasmussen.co.za>)
        id 1mPaBe-0003Fc-Ex; Sun, 12 Sep 2021 17:51:06 -0700
Date:   Sun, 12 Sep 2021 17:51:06 -0700 (PDT)
From:   Norman Rasmussen <norman@rasmussen.co.za>
To:     Sean Young <sean@mess.org>
cc:     linux-media@vger.kernel.org
Subject: [PATCH] ir-ctl: increase the size of the buffer used to read raw
 files
Message-ID: <436115bb-9f0-1e7-1682-a87c733312ad@darkskies.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Air conditioner codes typically have 100 pulse/space pairs (12 bytes +
headers). The resulting raw IR line length is 1063, which exceeds the
current 1024 byte buffer, and results in an error trying to parse the
line.

The buffers used to read pulse/space files are significantly larger than
needed so this decreases their size, and allocates the difference to the
buffer used to read raw IR files in order to keep the total size of
buffers the same.

Signed-off-by: Norman Rasmussen <norman@rasmussen.co.za>
---
  utils/ir-ctl/ir-ctl.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 3c3bcca1..46fe12d9 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -211,7 +211,7 @@ static struct send *read_file_pulse_space(struct arguments 
*args, const char *fn
  {
  	bool expect_pulse = true;
  	int lineno = 0, lastspace = 0;
-	char line[1024];
+	char line[512];
  	int len = 0;
  	static const char whitespace[] = " \n\r\t";
  	struct send *f;
@@ -380,7 +380,7 @@ static struct send *read_file_pulse_space(struct arguments 
*args, const char *fn
  static struct send *read_file_raw(struct arguments *args, const char *fname, 
FILE *input)
  {
  	int lineno = 0, lastspace = 0;
-	char line[1024];
+	char line[2048];
  	int len = 0;
  	static const char whitespace[] = " \n\r\t,";
  	struct send *f;
@@ -474,7 +474,7 @@ static struct send *read_file_raw(struct arguments *args, 
const char *fname, FIL
  static struct send *read_file(struct arguments *args, const char *fname)
  {
  	FILE *input = fopen(fname, "r");
-	char line[1024];
+	char line[512];

  	if (!input) {
  		fprintf(stderr, _("%s: could not open: %m\n"), fname);
-- 
2.30.2


-- 
- Norman Rasmussen
  - Email: norman@rasmussen.co.za
  - Home page: http://norman.rasmussen.co.za/
