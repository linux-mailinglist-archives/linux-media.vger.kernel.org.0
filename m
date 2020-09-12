Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D2826789A
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 09:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgILHpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 03:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgILHpO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 03:45:14 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B598CC061573
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 00:45:13 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a17so13543365wrn.6
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aql8/5pinrKHiuTkRAvMCbHphyM/SR7RYwaYN3vp3fc=;
        b=oHxJicdCzE7szgNcC+J+LicvlKFBe30osu89Ba/rB2AWJv/5gg5X5sq/zCoiGH6vFi
         kTUAfXYupMJE941vn9ouCSSqhPgyKHjpAgTRne1vTT93CkJXxuOM2nQGRy2fle3jH4YF
         Izb4V5xBKDDW5U+GiQihjnuRcUIBAeB9w4fY1I/GYxjwmINhSMohmpYN0FvNQhY69Tfr
         zzNWpsDEkQ6wPEydt9CJ8gIArR4b+rVz/XTKO8dkELAxlFIrBKI9KSZGUxk83OFKzP9y
         jxxysHpdtHQjtN6D7q/1MMQEpZMIddsOi2eR/0mkbFj6e3qUN6pkjquuz0r7DeWcOXJB
         RqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aql8/5pinrKHiuTkRAvMCbHphyM/SR7RYwaYN3vp3fc=;
        b=gikO59DY2AcSWOj3YVLPle26AM1aPAuk4xU5GVKnc1HuDxVmRbdTTOUO5h6OSSJKXr
         oUtQO2H8NNoX/NRGRk9a4RlZvC+zuKvYTs9aDh3O6VtONssTezn13nKBs1MlAktfchGG
         aA2adg4KlcZ2d2J6zNlNZVVmgrf3+cv3f/htz5eJClEcfpgzhbSSTMyhdn/hQuv7M+4L
         4hY+kbdfNYQxkBF0e06nvt1ed2ouXjvvVw1dlEweOCCLY5pChi0jy+/JxrY75qYvIrAQ
         FNg7yPjhaDZ388rghnyowtDW1u/x4CAIAvYZ0f4h7OOm0tdNjIv0mVZhhR5OKmhLe8fS
         sWPA==
X-Gm-Message-State: AOAM533h9qwmcFxag/PRv4/1PkLEVvLyhsNU2NqTU0xsZ1NxsMJ26tMY
        1xGNKW7vtjKXW1nsWS2jxSE=
X-Google-Smtp-Source: ABdhPJwnNK72KJd/vd/+1afj3vE8VjO0pdK6OabZgmtb+GRnTcaidc2tZIWPA6yEdVrmuti57Sryeg==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr5863974wrq.398.1599896712059;
        Sat, 12 Sep 2020 00:45:12 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id b11sm8992777wrt.38.2020.09.12.00.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2020 00:45:11 -0700 (PDT)
From:   Dan Scally <djrscally@gmail.com>
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        jorhand@linux.microsoft.com, andriy.shevchenko@linux.intel.com,
        Tsuchiya Yuto <kitakar@gmail.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200909134053.GA3699980@kuha.fi.intel.com>
Message-ID: <70b214fd-d199-ccb2-2a84-dc1f6f7c759f@gmail.com>
Date:   Sat, 12 Sep 2020 08:45:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909134053.GA3699980@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Heikki

On 09/09/2020 14:40, Heikki Krogerus wrote:
> I'm almost certain that my graph patch is broken. My tests did not
> cover nearly as much that is needed to properly test the patch. I
> think at least the refcount handling is totally broken in
> software_node_graph_get_next_endpoint(), so that function at least
> needs to be rewritten.
>
> Unfortunately I do not have time to work on that patch right now.
>
> thanks,

I managed to get to the bottom of the remaining issue (which was the 
cause of the problem I originally posted here about - that's now all 
resolved).  In addition to the refcount handling problems, 
software_node_graph_get_next_endpoint() was occasionally passing an 
invalid combination of parameters to software_node_get_next_child(); 
sometimes it would pass an existing endpoint as old in combination with 
a port which was not the endpoint's parent. Applying this on top of your 
patch seems to stop both of those errors:

---
  drivers/base/swnode.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 5cf9f1eef96f..80255e0b7739 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -563,6 +563,7 @@ software_node_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
  {
  	struct swnode *swnode = to_swnode(fwnode);
  	struct fwnode_handle *old = endpoint;
+	struct fwnode_handle *parent_of_old;
  	struct fwnode_handle *parent;
  	struct fwnode_handle *port;
  
@@ -581,10 +582,22 @@ software_node_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
  	}
  
  	for (; port; port = swnode_graph_find_next_port(parent, port)) {
+
+		if (old) {
+			parent_of_old = software_node_get_parent(old);
+
+			if (parent_of_old != port)
+				old = NULL;
+
+			fwnode_handle_put(parent_of_old);
+		}
+
  		endpoint = software_node_get_next_child(port, old);
  		fwnode_handle_put(old);
  		if (endpoint)
  			break;
+		else
+			fwnode_handle_put(port);
  	}
  
  	fwnode_handle_put(port);
-- 
2.25.1

Following that change, everything seems to be working ok. The module linking sensors to the cio2 infrastructure can correctly link multiple sensors now, and the reference count issues that prevented that module from unloading are resolved too.

Getting those patches and the bridge module upstream would be a good step to getting working cameras on ACPI platforms using ipu3. I'd like to take that on if you haven't the time; would you be ok with me applying my changes on top of your original patch, and submitting the combined result as a v2? And then I'll tackle any changes that come back - might take me a little while but I should be able to manage it.

Thanks
Dan

