Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEFA7984A0
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 11:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241404AbjIHJO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 05:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbjIHJO4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 05:14:56 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08FF1BF1
        for <linux-media@vger.kernel.org>; Fri,  8 Sep 2023 02:14:52 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so228861166b.3
        for <linux-media@vger.kernel.org>; Fri, 08 Sep 2023 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694164491; x=1694769291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spMrl03aG3cwXrmMb8I0m+ExCCr+3EoDtWgExjSIlcY=;
        b=AnHZEsPiuoOBbE8vqI3tMfqZV2mDQZFUYIwtFIVzDKdozDrI9Bfy7g4hgCtjSyOLDk
         OiIITQtPK4/IPPgHN22TfqT4lvr8nQOPOEGOkmE4YQO53HajqaYbrHJOjhnXOQRdesrY
         XEHZXGOtq2j5Krox+eTnJeIS/c9Qt0aztK6yUwnVvEgVmOJuDr8rxyjN1NBb/ZvLIe+J
         qoUDCvUZ6KyVmvuNdDUj7jT1xXfFtp0HQX5/ZADxZfKcOwQ0KzztIObHPqs9E7EviZ49
         PDRDyHmqWmanDxTVOpJ+UrfcMOUBTXpKso02A7wbXJXJO1P6HNEJO4jBhqLunFDZOsyK
         pxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694164491; x=1694769291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spMrl03aG3cwXrmMb8I0m+ExCCr+3EoDtWgExjSIlcY=;
        b=u7mQ20zMdQxeP99PGtH9uz3kbRoDrpKVy6cWm5ccZ+DVV/cZFK5ri0QcF9m17xNaBg
         n0/Z3x896Vgi7zTFovpy7cIwb6OEIdloIzgBP/94ctHaN8lNHCzslcSgbjJ8rn2ds1Mk
         f2yJ/gjJ641I3ipS05umXTpVzacd2t//2RNN7/Nb4DQwV+fEqDW4KyWud0zo5JDH2Qg7
         pNTzyAlLtzY7pr2LiwGV/3ZDfdHM0Q2BdVjwVJPFiy8aiL0sqC7zcSj/PkCoAZlCgcBv
         FWQNV4Vt+QaUG6A2PafLwG9hXjTleL9xvPjwURE3pN4uC2/xTV+DjSORSWbxEuVaJ9rW
         TsSA==
X-Gm-Message-State: AOJu0YwT6oM014YRfzSdlOdDj4Al3UGJPZXr7IweyxJjHl9EMhNmWW6c
        D/vclfWZrJPduPS27gSLt3lEUg==
X-Google-Smtp-Source: AGHT+IG+6c5QmxwOy0MLsp6n7CnKVdQLF0rSSStjLcvA94R0Y2CCCMNn2HX344MniLasrTX+78Sd2g==
X-Received: by 2002:a17:906:318d:b0:9a5:b630:a92a with SMTP id 13-20020a170906318d00b009a5b630a92amr1459179ejy.8.1694164491133;
        Fri, 08 Sep 2023 02:14:51 -0700 (PDT)
Received: from [192.168.37.45] (178235177197.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.197])
        by smtp.gmail.com with ESMTPSA id va17-20020a17090711d100b009929ab17be0sm751029ejb.162.2023.09.08.02.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 02:14:50 -0700 (PDT)
Message-ID: <1253a158-e867-4a9f-b846-d008e2756d74@linaro.org>
Date:   Fri, 8 Sep 2023 11:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/17] media: qcom: camss: Pass CAMSS subdev callbacks
 via resource ops pointer
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
 <20230907164410.36651-8-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20230907164410.36651-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7.09.2023 18:44, Bryan O'Donoghue wrote:
> It is possible to pass all of the CAMSS subdevice internal operations
> pointers from the controlling resources structure with an additional
> pointer added to the resources structure.
> 
> This allows for the removal of most of the probe-time control structures.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
[...]

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 54886a2a449b0..12131d9ea7ca8 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -42,7 +42,8 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
>  				{ 0 },
>  				{ 100000000, 200000000 } },
>  		.reg = { "csiphy0", "csiphy0_clk_mux" },
> -		.interrupt = { "csiphy0" }
> +		.interrupt = { "csiphy0" },
> +		.ops = &csiphy_ops_2ph_1_0
I'd really vouch for adding commas at the end, so that the
next diffs will be smaller

otherwise

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
