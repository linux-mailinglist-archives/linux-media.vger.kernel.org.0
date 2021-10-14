Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A1842D816
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 13:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhJNLYy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 07:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhJNLYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 07:24:52 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE35C061570;
        Thu, 14 Oct 2021 04:22:46 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ayormQkrqk3b0ayoumYC8d; Thu, 14 Oct 2021 13:22:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634210565; bh=8KTB2+Q7JrWGhv8MdC4DXwLhN1UM+TlCt/Lif4SrTKs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e3MxV3wgT8GwV8bz7oF7rPiITdIhnw4vWkuOePSzMh7iBZL1v1xGlEzYnwghRFqA3
         HS5EfHz57aOipBbhnvbBRti/abkt/7h6Zz6GESsqflC6v6PQ6PZ0DkiAATWL/0ScMw
         Bsww050dvjnc1xFKsN5pzMaCYeCvw7UpHMNE2gdrC+0c6VH+Idw6uh9a/o/JiMIZ2S
         WEHtDDm7oNQWN4r84OHUocxrc1tTnatsQ4OxVHcPiJKgxHVT+I+3BlGiBcPAYiYQHn
         /wear97xboMd9dx6NryeAwPvO7g8FuR9I7fuRalwPw1LtSH/mz5ypd3Grqa1T2btFa
         +NVOAtP6C5Jlg==
Subject: Re: [PATCH v4 6/8] media: v4l2-ctrls: Add RGB color effects control
To:     Dillon Min <dillon.minfei@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com,
        Patrice CHOTARD <patrice.chotard@foss.st.com>,
        hugues.fruchet@foss.st.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
 <1634207106-7632-7-git-send-email-dillon.minfei@gmail.com>
 <2b0739f1-85e4-6b19-ff30-2587f0c622c2@xs4all.nl>
 <CAL9mu0LqkCpjYft4z6V4T97Mq46dCTXZ=BvfQa+DijjRd4pDkA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1d0e5b17-dd2c-d3d3-c514-775806ae99c9@xs4all.nl>
Date:   Thu, 14 Oct 2021 13:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0LqkCpjYft4z6V4T97Mq46dCTXZ=BvfQa+DijjRd4pDkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDoed45rU1XMoHUiCtoyy6GO82RajXOAuq0okRq9Kg/1ImwWutmeAs6WL5eO+Y+tOe6gMec2b6uIu46btDt8KmKVRmbPu5fuSsge8EaRIbe/EMY+2IOV
 tmPI5YCGHIu+aackpCK26x69Duu2OsHQVDKQW6qqk08Drs9vCJa6hWojS+iax9DR+/3V72PrTVo6GLkX8M8AoO7vJGi95Op4ljwl5G/TUjcRwZVwBBuz2Ca6
 mJHvtfqKwHMD0d3WmVvn/HSUNVAw1HapFgBQ9NWbGF2M33dX7WDLy8Ll7QGDpl3RFi9WHVawkxCOClfMLuPztvy6vyK4ZpUQNYEno2WRdv41Az/+OGTYBReF
 8BCq2qARHLp7jk8KJGphfsCL0HguLSeJwB2xGedGYQ4nTO6nhMBlqg3H5UtT861IFMtSXsiwNDHYZzBE5ztpdfsJZItlSt/56T4qWqbRaGnCEi8+CA6vM+WH
 Qm5qN4sZp+mPmNcPbbsxNt+nKlS6toivePX7ZWQQMqpDNSZKN+G1Jyr/eyTJpG3pdSPzcZjAXcgRUOODgNIjtS2pstPWN/x8F6WPy8zkqqj1G+abHLZCBkT/
 gQypCgfV/M5/OsrXpSH70QjGaLUB7HLifsWbF8w6wjJ+1CYAm99cWya9peM73C1D6NExbgsMASR0nwpGs8JSOutN4mhXsvf25yD2rpOXHALPSwTTf7V4ZH9n
 IjTvc70Dr97bCzxTvDAYhsp2FK46fyLSmOwv81uOQ6jY1GP02noRNOG8L8xvkmc6iPoTVbhtduTfJzKGslLynOJNwMTUcru1qIjDDCe3URrSodYEy+EkljVM
 ZroVl7TwidvAzrdMdVqNLhLvLwvC/S8OAyDiQYsxo6366pdhaZDunRh+G4hoU3hvtdzRAtb5kU1iEca8bUsYXCrS/ZCvYIEkFiE8EozQwnzot8buVAXYs7Ej
 COU3Pud39XURrUI1XJ0xP4V4q7Y=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/10/2021 12:53, Dillon Min wrote:
> Hi Hans
> 
> Thanks for quick reply
> 
> On Thu, 14 Oct 2021 at 18:44, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 14/10/2021 12:25, dillon.minfei@gmail.com wrote:
>>> From: Dillon Min <dillon.minfei@gmail.com>
>>>
>>> Add V4L2_COLORFX_SET_RGB color effects control, V4L2_CID_COLORFX_RGB
>>> for RGB color setting.
>>>
>>> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
>>> ---
>>> v4:
>>> - replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
>>>   V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
>>>   in current. thanks Hans.
>>>
>>>  Documentation/userspace-api/media/v4l/control.rst | 9 +++++++++
>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
>>>  include/uapi/linux/v4l2-controls.h                | 4 +++-
>>>  3 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
>>> index f8d0b923da20..3eec65174260 100644
>>> --- a/Documentation/userspace-api/media/v4l/control.rst
>>> +++ b/Documentation/userspace-api/media/v4l/control.rst
>>> @@ -242,8 +242,17 @@ Control IDs
>>>      * - ``V4L2_COLORFX_SET_CBCR``
>>>        - The Cb and Cr chroma components are replaced by fixed coefficients
>>>       determined by ``V4L2_CID_COLORFX_CBCR`` control.
>>> +    * - ``V4L2_COLORFX_SET_RGB``
>>> +      - The RGB components are replaced by the fixed RGB components determined
>>> +        by ``V4L2_CID_COLORFX_RGB`` control.
>>>
>>>
>>> +``V4L2_CID_COLORFX_RGB`` ``(integer)``
>>> +    Determines the Red, Green, and Blue coefficients for
>>> +    ``V4L2_COLORFX_SET_RGB`` color effect.
>>> +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
>>> +    bits [15:8] as Green component, bits [23:16] as Red component, and
>>> +    bits [31:24] must be zero.
>>>
>>>  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
>>>      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> index 421300e13a41..f4bd90170105 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:   return "Min Number of Output Buffers";
>>>       case V4L2_CID_ALPHA_COMPONENT:          return "Alpha Component";
>>>       case V4L2_CID_COLORFX_CBCR:             return "Color Effects, CbCr";
>>> +     case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
>>>
>>>       /*
>>>        * Codec controls
>>> @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>               *min = *max = *step = *def = 0;
>>>               break;
>>>       case V4L2_CID_BG_COLOR:
>>> +     case V4L2_CID_COLORFX_RGB:
>>>               *type = V4L2_CTRL_TYPE_INTEGER;
>>>               *step = 1;
>>>               *min = 0;
>>
>> Can you make another small change here? Please change:
>>
>>         *max = 0xFFFFFF;
>>
>> to:
>>
>>         *max = 0xffffff;
>>
>> to keep in line with the coding standard for hex values.
> 
> Sure, do it right now.
> 
>>
>> Also, can you add a separate patch that adds an entry here for V4L2_CID_COLORFX_CBCR
>> that sets *max to 0xffff? I noticed that that was missing. While adding V4L2_CID_COLORFX_RGB
>> it's good to fix V4L2_CID_COLORFX_CBCR as well.
> 
> Sure, you mean the final code like this? first patch to fix cbcr 0xFFFFFF,

For cbcr max should be 0xffff.

> another one to add V4L2_CID_COLORFX_RGB entry.
> 
> 1395         case V4L2_CID_BG_COLOR:
> 1396         case V4L2_CID_COLORFX_RGB:
> 1397                 *type = V4L2_CTRL_TYPE_INTEGER;
> 1398                 *step = 1;
> 1399                 *min = 0;
> 1400                 /* Max is calculated as RGB888 that is 2^24 */

Actually, the comment is wrong: it should be 2^24-1. Let's fix that too.

> 1401                 *max = 0xffffff;

Yes, that's what I am looking for.

Regards,

	Hans

> 1402                 break;
> 
> Best Regards
> Dillon
> 
>>
>> Regards,
>>
>>         Hans
>>
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index 5532b5f68493..9aa3fd368383 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -128,6 +128,7 @@ enum v4l2_colorfx {
>>>       V4L2_COLORFX_SOLARIZATION               = 13,
>>>       V4L2_COLORFX_ANTIQUE                    = 14,
>>>       V4L2_COLORFX_SET_CBCR                   = 15,
>>> +     V4L2_COLORFX_SET_RGB                    = 16,
>>>  };
>>>  #define V4L2_CID_AUTOBRIGHTNESS                      (V4L2_CID_BASE+32)
>>>  #define V4L2_CID_BAND_STOP_FILTER            (V4L2_CID_BASE+33)
>>> @@ -145,9 +146,10 @@ enum v4l2_colorfx {
>>>
>>>  #define V4L2_CID_ALPHA_COMPONENT             (V4L2_CID_BASE+41)
>>>  #define V4L2_CID_COLORFX_CBCR                        (V4L2_CID_BASE+42)
>>> +#define V4L2_CID_COLORFX_RGB                 (V4L2_CID_BASE+43)
>>>
>>>  /* last CID + 1 */
>>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
>>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>>>
>>>  /* USER-class private control IDs */
>>>
>>>
>>

