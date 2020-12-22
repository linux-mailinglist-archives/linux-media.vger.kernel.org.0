Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF962E0ECB
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgLVTSg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgLVTSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:18:36 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC7FC0613D6;
        Tue, 22 Dec 2020 11:17:55 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b26so25016015lff.9;
        Tue, 22 Dec 2020 11:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uAS0dihWy6acCqxpttIdhhTtHB8s/0UZpEYGm2Afc0A=;
        b=Ja6Fajx15rlf/wUqhyfUGdtaYQa9NzWt1VxfeKaPGV9DHxto9LH4yd453M9YVRn9hR
         kMbMcKAkpViTQLSWE6kfgTI9BzKCWleBfhF4TmcR8FomhMo+L1pLmEMxbkFr4E1Svw1X
         iH6DJqofxOW5ofM0w9hmIf01D2Fp9mgjq3RzN5mL/qEtilJU/pFtiNljC50W1hqQ9h6Z
         L1euixnvk5wTR9lEvRSwJzkfEpU9tm8R+yftg3S65OZT5rgnL5Tfw2M2LGeki9D0BLqS
         wI4IXEjFsh3bdQ1a0XPmqyAso4vjl+nJSZ1RGI4YOqkQWlpnKFhv+ZGCJjn//trtFq6Z
         QEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uAS0dihWy6acCqxpttIdhhTtHB8s/0UZpEYGm2Afc0A=;
        b=CW7XuJyM06nTCd7ZzHpmMbRBtXqJc3TpBYgIpbEp4CsFCA6wVLDaKwiWF4Bk+g889w
         Unx7pEP8tF+PO1NdrB9+8pvpn8IQINoZHdL7CvgrQIx+nz5lPAipEba5c1Hwfr5l61lf
         BsoZTl+sDc+/Qg8SsmXT2TMNdynpruhGSdJVEiNiVLytLjQzWkiGhw9KyfW4as1I6RDm
         ER/lO/zj2804yIsSeRWyKvAl+NtmLUIHWQkkWmyO2zRLP+DyfXZ5691azgbE1PJSHb/k
         ODnTzNICB4WncuUnAhWYZ6UnYPFaOorM9wqttImggwmuU+tBbwlauiU4WtdzDUcb3RXd
         NNqg==
X-Gm-Message-State: AOAM5311irgFsrl4TkrIF0fiuAOt0oYr/P0811xKLOpanG/jepvlw3xW
        /Pg/NN2t02c7daqa0jnQXdVHw25uzpM=
X-Google-Smtp-Source: ABdhPJxG08S3x744/H672jNAdqohPPQE2x83DMhx6bVvTBDJ0O2sHn/mTSk/1sieF+CRr2XQTCHbeg==
X-Received: by 2002:a19:d93:: with SMTP id 141mr9654897lfn.229.1608664674109;
        Tue, 22 Dec 2020 11:17:54 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id y9sm3014739ljy.37.2020.12.22.11.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:17:53 -0800 (PST)
Subject: Re: [PATCH v2 14/48] opp: Filter out OPPs based on availability of a
 required-OPP
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-15-digetx@gmail.com>
 <20201222085940.y625zxee4tevbqm5@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9ed8bde3-f7b5-025c-c038-87f35ea39e5f@gmail.com>
Date:   Tue, 22 Dec 2020 22:17:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222085940.y625zxee4tevbqm5@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 11:59, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> A required OPP may not be available, and thus, all OPPs which are using
>> this required OPP should be unavailable too.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/opp/core.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> Please send a separate patchset for fixes, as these can also go to 5.11 itself.

Alright, although I don't think that this patch fixes any problems for
existing OPP users.

>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> index d9feb7639598..3d02fe33630b 100644
>> --- a/drivers/opp/core.c
>> +++ b/drivers/opp/core.c
>> @@ -1588,7 +1588,7 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
>>  	     struct opp_table *opp_table, bool rate_not_available)
>>  {
>>  	struct list_head *head;
>> -	int ret;
>> +	int i, ret;
>>  
>>  	mutex_lock(&opp_table->lock);
>>  	head = &opp_table->opp_list;
>> @@ -1615,6 +1615,15 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
>>  			 __func__, new_opp->rate);
>>  	}
>>  
>> +	for (i = 0; i < opp_table->required_opp_count && new_opp->available; i++) {
>> +		if (new_opp->required_opps[i]->available)
>> +			continue;
>> +
>> +		new_opp->available = false;
>> +		dev_warn(dev, "%s: OPP not supported by required OPP %pOF (%lu)\n",
>> +			 __func__, new_opp->required_opps[i]->np, new_opp->rate);
> 
> Why not just break from here ?

The new_opp could be already marked as unavailable by a previous voltage
check, hence this loop should be skipped entirely in that case.
