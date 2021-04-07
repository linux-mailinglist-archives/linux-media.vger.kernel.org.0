Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872E8357034
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 17:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353529AbhDGP1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 11:27:34 -0400
Received: from gusto.metanet.ch ([80.74.154.155]:49560 "EHLO gusto.metanet.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236449AbhDGP1c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 11:27:32 -0400
Received: from [IPv6:2001:67c:10ec:574f:8000::2c4] (localhost [127.0.0.1]) by gusto.metanet.ch (Postfix) with ESMTPSA id AB6F64F016E0;
        Wed,  7 Apr 2021 17:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fabwu.ch; s=default;
        t=1617809238; bh=D2nMGziQThQB3e4hbgZ6otxE72X0dpRPOIg3mDcY+EU=;
        h=Subject:To:From;
        b=xEmZfsV40H5sROkOEGY/MiXlVCBVDY/NUjmqm9TzTl3CGeH8KfOkbthwo4RCbPqSc
         3no46eWM9fL7o/EqhYQ0uH38yhtEssQtG3GDcomYkYHOMqB6QIDd/4crRG/wK3nnFK
         UGqU7WbU8SfMY/30w1HHYQKRBkCZGXx0WJhPYYzg=
Authentication-Results: gusto.metanet.ch;
        spf=pass (sender IP is 2001:67c:10ec:574f:8000::2c4) smtp.mailfrom=me@fabwu.ch smtp.helo=[IPv6:2001:67c:10ec:574f:8000::2c4]
Received-SPF: pass (gusto.metanet.ch: connection is authenticated)
Subject: Re: [PATCH] ipu3-cio2: Parse sensor orientation and rotation
To:     Daniel Scally <djrscally@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210321191155.55723-1-me@fabwu.ch>
 <20210407082205.pdbwwnv72cuuqkdy@uno.localdomain>
 <4298d41f-8b06-356d-ea29-11eb0da6e00b@fabwu.ch>
 <20210407124139.6w32oosdd4kyjcde@uno.localdomain>
 <2090a4ab-bb07-140a-f794-764f18969854@fabwu.ch>
 <96e8a8b6-61cb-6592-9197-a6341b9ccc0f@gmail.com>
From:   =?UTF-8?Q?Fabian_W=c3=bcthrich?= <me@fabwu.ch>
Message-ID: <beb418a4-10ed-cb55-1075-96aea0b9584c@fabwu.ch>
Date:   Wed, 7 Apr 2021 17:27:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <96e8a8b6-61cb-6592-9197-a6341b9ccc0f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 07.04.21 15:51, Daniel Scally wrote:
> Hi Fabian, Jacopo
> 
> On 07/04/2021 14:19, Fabian Wüthrich wrote:
>> That's a good point but I'm also not experienced enough to answer this question.
>>
>> It looks like that these SSDB buffers are device specific and every vendor has its
>> own memory layout. So parsing these in the core could be difficult.
>>
>> Maybe Dan knows more...
> 
> 
> I think the cio2-bridge is the right place to handle it; as far as we
> know that buffer only appears on Intel skl/kbl devices that have an IPU3
> for the cameras to connect to. To say it's all a bit outside the normal
> ACPI specifications would be an understatement, so this isn't a solution
> for ACPI generally but rather just for a few specific product ranges.
> 

I agree. I'll post a v2 soon with your comments addressed.

>> On 07.04.21 14:41, Jacopo Mondi wrote:
>>> Hi Fabian,
>>>
>>> On Wed, Apr 07, 2021 at 01:52:31PM +0200, Fabian Wüthrich wrote:
>>>>
>>>> On 07.04.21 10:22, Jacopo Mondi wrote:
>>>>> Hi Fabian,
>>>>>
>>>>> On Sun, Mar 21, 2021 at 08:11:56PM +0100, Fabian Wüthrich wrote:
>>>>>> The sensor orientation is read from the _PLC ACPI buffer and converted
>>>>>> to a v4l2 format.
>>>>>>
>>>>>> See https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
>>>>>> page 351 for a definition of the Panel property.
>>>>>>
>>>>>> The sensor rotation is read from the SSDB ACPI buffer and converted into
>>>>>> degrees.
>>>>>>
>>>>> The framework has v4l2_fwnode_device_parse() in v4l2-fwnode.c which
>>>>> works for DT based systems. Could support for retreiving those
>>>>> properties from the SSDB block be added there ?
>>>>>
>>>>> Thanks
>>>>>   j
>>>>>
>>>> This is exactly the purpose of this patch. I've should have been more precise
>>>> in the commit message but basically this patch converts the properties from
>>>> the SSDB block into fwnodes which are then picked up by v4l2_fwnode_device_parse().
>>> Ah, right! The cio2_bridge_create_fwnode_properties() should have
>>> hinted me... My question was more on the lines of: "Instead of parsing
>>> the SSDB block in the CIO2 driver to translate into v4l2-fwnode
>>> consumable properties, can the parsing be done directly into the
>>> core" due to my poor understanding of the swnode infrastructure.
>>>
>>> Thanks for clarifying
>>>
>>>> P.S. I have a quick question below
>>>>
>>>>>> Signed-off-by: Fabian Wüthrich <me@fabwu.ch>
>>>>>> ---
>>>>>>  drivers/media/pci/intel/ipu3/cio2-bridge.c | 60 ++++++++++++++++++++--
>>>>>>  drivers/media/pci/intel/ipu3/cio2-bridge.h | 16 ++++++
>>>>>>  2 files changed, 72 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>>>>>> index c2199042d3db..503809907b92 100644
>>>>>> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
>>>>>> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>>>>>> @@ -29,6 +29,7 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
>>>>>>  static const struct cio2_property_names prop_names = {
>>>>>>  	.clock_frequency = "clock-frequency",
>>>>>>  	.rotation = "rotation",
>>>>>> +	.orientation = "orientation",
>>>>>>  	.bus_type = "bus-type",
>>>>>>  	.data_lanes = "data-lanes",
>>>>>>  	.remote_endpoint = "remote-endpoint",
>>>>>> @@ -72,11 +73,51 @@ static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
>>>>>>  	return ret;
>>>>>>  }
>>>>>>
>>>>>> +static u32 cio2_bridge_parse_rotation(struct cio2_sensor *sensor)
>>>>>> +{
>>>>>> +	switch (sensor->ssdb.degree) {
>>>>>> +	case CIO2_SENSOR_ROTATION_NORMAL:
>>>>>> +		return 0;
>>>>>> +	case CIO2_SENSOR_ROTATION_INVERTED:
>>>>>> +		return 180;
>>>>>> +	default:
>>>>>> +		dev_warn(&sensor->adev->dev,
>>>>>> +			 "Unknown rotation %d. Assume 0 degree rotation\n",
>>>>>> +			 sensor->ssdb.degree);
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>> +static enum v4l2_fwnode_orientation cio2_bridge_parse_orientation(struct cio2_sensor *sensor)
>>>>>> +{
>>>>>> +	switch (sensor->pld->panel) {
>>>>>> +	case CIO2_PLD_PANEL_FRONT:
>>>>>> +		return V4L2_FWNODE_ORIENTATION_FRONT;
>>>>>> +	case CIO2_PLD_PANEL_BACK:
>>>>>> +		return V4L2_FWNODE_ORIENTATION_BACK;
>>>>>> +	case CIO2_PLD_PANEL_TOP:
>>>>>> +	case CIO2_PLD_PANEL_LEFT:
>>>>>> +	case CIO2_PLD_PANEL_RIGHT:
>>>>>> +	case CIO2_PLD_PANEL_UNKNOWN:
>>>>>> +		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
>>>>>> +	default:
>>>>>> +		dev_warn(&sensor->adev->dev, "Unknown _PLD panel value %d\n",
>>>>>> +			 sensor->pld->panel);
>>>>>> +		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
>>>>>> +	}
>>>>>> +}
>>>> These constants are ACPI related and shouldn't be here. Should I move them to e.g.
>>>> include/acpi/acbuffer.h or do you know a better place?
>>>>
>>> I know very few things about ACPI, don't think I'm the right person to
>>> answer that question :)
>>>
>>> Although as I read the definitions of ACPI_PLD_GET_ROTATION() and
>>> ACPI_PLD_GET_PANEL() and see they match the bit offset as reported by
>>> the ACPI specs you linked here above, I would say your suggestion
>>> makes sense, but please confirm with someone that knows better :)
>>>
>>> Thanks
>>>   j
>>>
>>>>>> +
>>>>>>  static void cio2_bridge_create_fwnode_properties(
>>>>>>  	struct cio2_sensor *sensor,
>>>>>>  	struct cio2_bridge *bridge,
>>>>>>  	const struct cio2_sensor_config *cfg)
>>>>>>  {
>>>>>> +	u32 rotation;
>>>>>> +	enum v4l2_fwnode_orientation orientation;
>>>>>> +
>>>>>> +	rotation = cio2_bridge_parse_rotation(sensor);
>>>>>> +	orientation = cio2_bridge_parse_orientation(sensor);
>>>>>> +
>>>>>>  	sensor->prop_names = prop_names;
>>>>>>
>>>>>>  	sensor->local_ref[0].node = &sensor->swnodes[SWNODE_CIO2_ENDPOINT];
>>>>>> @@ -85,9 +126,12 @@ static void cio2_bridge_create_fwnode_properties(
>>>>>>  	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(
>>>>>>  					sensor->prop_names.clock_frequency,
>>>>>>  					sensor->ssdb.mclkspeed);
>>>>>> -	sensor->dev_properties[1] = PROPERTY_ENTRY_U8(
>>>>>> +	sensor->dev_properties[1] = PROPERTY_ENTRY_U32(
>>>>>>  					sensor->prop_names.rotation,
>>>>>> -					sensor->ssdb.degree);
>>>>>> +					rotation);
>>>>>> +	sensor->dev_properties[2] = PROPERTY_ENTRY_U32(
>>>>>> +					sensor->prop_names.orientation,
>>>>>> +					orientation);
>>>>>>
>>>>>>  	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(
>>>>>>  					sensor->prop_names.bus_type,
>>>>>> @@ -159,6 +203,7 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
>>>>>>  	for (i = 0; i < bridge->n_sensors; i++) {
>>>>>>  		sensor = &bridge->sensors[i];
>>>>>>  		software_node_unregister_nodes(sensor->swnodes);
>>>>>> +		ACPI_FREE(sensor->pld);
>>>>>>  		acpi_dev_put(sensor->adev);
>>>>>>  	}
>>>>>>  }
>>>>>> @@ -170,6 +215,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>>>>>>  	struct fwnode_handle *fwnode;
>>>>>>  	struct cio2_sensor *sensor;
>>>>>>  	struct acpi_device *adev;
>>>>>> +	acpi_status status;
>>>>>>  	int ret;
>>>>>>
>>>>>>  	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
>>>>>> @@ -193,11 +239,15 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>>>>>>  		if (ret)
>>>>>>  			goto err_put_adev;
>>>>>>
>>>>>> +		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
>>>>>> +		if (ACPI_FAILURE(status))
>>>>>> +			goto err_put_adev;
>>>>>> +
>>>>>>  		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
>>>>>>  			dev_err(&adev->dev,
>>>>>>  				"Number of lanes in SSDB is invalid\n");
>>>>>>  			ret = -EINVAL;
>>>>>> -			goto err_put_adev;
>>>>>> +			goto err_free_pld;
>>>>>>  		}
>>>>>>
>>>>>>  		cio2_bridge_create_fwnode_properties(sensor, bridge, cfg);
>>>>>> @@ -205,7 +255,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>>>>>>
>>>>>>  		ret = software_node_register_nodes(sensor->swnodes);
>>>>>>  		if (ret)
>>>>>> -			goto err_put_adev;
>>>>>> +			goto err_free_pld;
>>>>>>
>>>>>>  		fwnode = software_node_fwnode(&sensor->swnodes[
>>>>>>  						      SWNODE_SENSOR_HID]);
>>>>>> @@ -226,6 +276,8 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>>>>>>
>>>>>>  err_free_swnodes:
>>>>>>  	software_node_unregister_nodes(sensor->swnodes);
>>>>>> +err_free_pld:
>>>>>> +	ACPI_FREE(sensor->pld);
>>>>>>  err_put_adev:
>>>>>>  	acpi_dev_put(sensor->adev);
>>>>>>  err_out:
>>>>>> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
>>>>>> index dd0ffcafa489..e1e388cc9f45 100644
>>>>>> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
>>>>>> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
>>>>>> @@ -12,6 +12,19 @@
>>>>>>  #define CIO2_MAX_LANES				4
>>>>>>  #define MAX_NUM_LINK_FREQS			3
>>>>>>
>>>>>> +/* Values are estimated guesses as we don't have a spec */
>>>>>> +#define CIO2_SENSOR_ROTATION_NORMAL		0
>>>>>> +#define CIO2_SENSOR_ROTATION_INVERTED		1
>>>>>> +
>>>>>> +/* Panel position defined in _PLD section of ACPI Specification 6.3 */
>>>>>> +#define CIO2_PLD_PANEL_TOP			0
>>>>>> +#define CIO2_PLD_PANEL_BOTTOM			1
>>>>>> +#define CIO2_PLD_PANEL_LEFT			2
>>>>>> +#define CIO2_PLD_PANEL_RIGHT			3
>>>>>> +#define CIO2_PLD_PANEL_FRONT			4
>>>>>> +#define CIO2_PLD_PANEL_BACK			5
>>>>>> +#define CIO2_PLD_PANEL_UNKNOWN			6
>>>>>> +
>>>>>>  #define CIO2_SENSOR_CONFIG(_HID, _NR, ...)	\
>>>>>>  	(const struct cio2_sensor_config) {	\
>>>>>>  		.hid = _HID,			\
>>>>>> @@ -80,6 +93,7 @@ struct cio2_sensor_ssdb {
>>>>>>  struct cio2_property_names {
>>>>>>  	char clock_frequency[16];
>>>>>>  	char rotation[9];
>>>>>> +	char orientation[12];
>>>>>>  	char bus_type[9];
>>>>>>  	char data_lanes[11];
>>>>>>  	char remote_endpoint[16];
>>>>>> @@ -106,6 +120,8 @@ struct cio2_sensor {
>>>>>>  	struct cio2_node_names node_names;
>>>>>>
>>>>>>  	struct cio2_sensor_ssdb ssdb;
>>>>>> +	struct acpi_pld_info *pld;
>>>>>> +
>>>>>>  	struct cio2_property_names prop_names;
>>>>>>  	struct property_entry ep_properties[5];
>>>>>>  	struct property_entry dev_properties[3];
>>>>>> --
>>>>>> 2.31.0
>>>>>>
