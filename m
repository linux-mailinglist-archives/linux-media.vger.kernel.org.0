Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11488339EB0
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhCMOwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbhCMOvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:51:50 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF83C061574
        for <linux-media@vger.kernel.org>; Sat, 13 Mar 2021 06:51:50 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id l15so5711585qvl.4
        for <linux-media@vger.kernel.org>; Sat, 13 Mar 2021 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=PupIkF/7i3Y2UOV6hRRIgjSWhNK3V0kQ1xe6TbeRbBw=;
        b=fHUPrSj+hA6ytb/sQxDT/RZrQebuXh6KbflCoKQldz8YqdAgnv74I4zgTf8+WxudHY
         JbrFPxLvAp8Jxsqxyn+dMZdolKriuvDw/2uhJaSnO2OhD73xpY5SWz3enZGBrxmbErY0
         f9WqMpH74sDdR9WguQWVuZ3Nr2OJFP0g4vVQZ+8NPmzr/qICk5jmerw/jaNB/y3W9B+1
         ckTXsoB58aZy92Efl5Ne683Qb4uB/C3LPsmyelvcMNvADuyQ63k69riFnGAPupUmiTf/
         Ib62crGyLRNWMKMqrWRggjvz1LLSSduqXLrFca1yzCN9AdWTQ9Ih8iws4C/Q9ilEyt7U
         DB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=PupIkF/7i3Y2UOV6hRRIgjSWhNK3V0kQ1xe6TbeRbBw=;
        b=WUVHF5oSbc4PWHJr5113sn3o1Lv+QTZjtR3KoD8/e5JHQyjJFdL62qGN11OgZQusPp
         IYNKHV+2nZXOgcmYq3zrAL2PR7vs1f+efaaJOGWtV5PvaTV6w544080FQcn0LArTUiRJ
         RERePEL+1QrAw6sMTSfvaKyHrixv62nuUvwqj6lY4PwRCcHLrY0kKzkXAzD1g4Vy00kT
         ejeYCTWz4rguP4BMlPWNT6kBp7J9uusWpHqSWL1knhFV2UzwgutnQEpWvCkMVY/kreQ5
         THix+w8r4RXISEiLSsedbEbvh5GowNOzqeDRYqLuwRSEexzGqVH8RBTyxkiRCKSzw52S
         asqg==
X-Gm-Message-State: AOAM530qSZL0U2DGeaLlMUFBMvQ1+Gg36J8BOS+5ctC3GxMftHBlNoix
        62E64d86gIswAOaLmJthj9RibWuxSKe38w==
X-Google-Smtp-Source: ABdhPJxOy6flUgUOnIIyZ2zZN9+Qz7XGq1o8ktDErwnsC6tQqqA84aEZVaiBZJ+oXKFB8vBiI2KKrA==
X-Received: by 2002:a05:6214:12a1:: with SMTP id w1mr17005886qvu.57.1615647109656;
        Sat, 13 Mar 2021 06:51:49 -0800 (PST)
Received: from [192.168.80.12] ([24.105.64.120])
        by smtp.gmail.com with ESMTPSA id w13sm6174427qtv.37.2021.03.13.06.51.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Mar 2021 06:51:49 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   Vincent Fortier <th0ma7@gmail.com>
Subject: [PATCH 2/2] media_build: Allow cross-environment strip command
Message-ID: <374c79c8-c56b-ec79-311f-b27aa3220432@gmail.com>
Date:   Sat, 13 Mar 2021 09:51:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

The current framework assume the strip command is natively available.  
While using external toolchain to cross-compile there is a need to point 
towards such tool using a STRIP variable environment using spksrc 
SynoCommunity framework.

The following patch tries to address this.

Signed-off-by: Vincent Fortier<th0ma7@gmail.com>

---

diff -uprN ../linuxtv.orig/v4l/Makefile v4l/Makefile
--- ../linuxtv.orig/v4l/Makefile    2021-02-08 10:24:43.000000000 +0000
+++ v4l/Makefile    2021-03-13 13:58:27.939468937 +0000
@@ -44,6 +44,11 @@ endif

  endif    # TOPDIR

+# Allow passing STRIP variable to use cross-compiler toolset
+ifeq ($(strip $(STRIP)),)
+STRIP = strip
+endif
+
  #################################################
  # default compilation rule

@@ -411,7 +416,7 @@ cx88-ivtv::
  old-install:: rminstall
      @echo -e "\nInstalling new V4L modules at $(DEST)..."

-    @strip --strip-debug $(inst-m)
+    $(STRIP) --strip-debug $(inst-m)

      -install -d $(DEST)
      -install -m 644 -c $(inst-m) $(DEST)
diff -uprN ../linuxtv.orig/v4l/scripts/make_makefile.pl 
v4l/scripts/make_makefile.pl
--- ../linuxtv.orig/v4l/scripts/make_makefile.pl    2021-02-08 
10:24:43.000000000 +0000
+++ v4l/scripts/make_makefile.pl    2021-03-13 13:55:46.534414452 +0000
@@ -254,7 +254,7 @@ while (my ($dir, $files) = each %instdir
      print OUT "echo -n \"\$\$i \"; ";
      print OUT "install -m 644 -c \$\$i \$(DESTDIR)\$(KDIR26)/$dir; fi; 
done; ";
      print OUT "if [  \$\$n -ne 0 ]; then echo; ";
-    print OUT "strip --strip-debug \$(DESTDIR)\$(KDIR26)/$dir/*.ko; ";
+    print OUT "\$(STRIP) --strip-debug \$(DESTDIR)\$(KDIR26)/$dir/*.ko; ";
      print OUT "fi;\n\n";
  }
  print OUT "\t@echo\n";

