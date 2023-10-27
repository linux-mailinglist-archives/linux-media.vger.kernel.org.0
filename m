Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3547D9A97
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 15:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345999AbjJ0N7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 09:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345996AbjJ0N7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 09:59:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EE59D;
        Fri, 27 Oct 2023 06:59:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C470669;
        Fri, 27 Oct 2023 15:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698415152;
        bh=qy3OV+oVLswhPVYdmyNKUZ+5Ki2nQnWalqpPIFwMaJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u4P+V4BTMIsR9Uwq4hzUERIX2KE0g88B10Ew8UAwgTjQxEob43Q1iFPYsv/k6B1Is
         I/cKgqrawbTQPD+wSg1gxNU25/axdZGSMg2sV+NVbNJj+LKqKkG4o2cC0vQD+zWr/Q
         NqIvwtmmSKXa+mdUSDIt2MI+kkXmVO1aDtM6IhNw=
Date:   Fri, 27 Oct 2023 16:59:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 3/3] media: i2c: Add driver for THine THP7312
Message-ID: <20231027135931.GA20465@pendragon.ideasonboard.com>
References: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
 <20231017132103.9914-4-laurent.pinchart@ideasonboard.com>
 <ZTutbU1XG_jKZbIp@valkosipuli.retiisi.eu>
 <20231027124529.GA19539@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231027124529.GA19539@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 27, 2023 at 03:45:30PM +0300, Laurent Pinchart wrote:
> On Fri, Oct 27, 2023 at 12:30:37PM +0000, Sakari Ailus wrote:
> > On Tue, Oct 17, 2023 at 04:21:03PM +0300, Laurent Pinchart wrote:
> > > From: Paul Elder <paul.elder@ideasonboard.com>
> > > 
> > > The THP7312 is an external camera ISP from THine. Add a V4L2 subdev
> > > driver for it.
> > > 
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v3:
> > > 
> > > - Move thp7312_get_regulators() to probe section
> > > - Turn firmware update handlers static
> > > - Wire up power management in struct driver
> > > - Remove unnecessary double underscore function prefixes
> > > - Configure CSI-2 lanes at stream on time
> > > - Clean up naming of power management functions
> > > 
> > > Changes since v2:
> > > 
> > > - Make boot-mode property optional
> > > - Fix dev_err_probe() usage in DT parsing
> > > - Additional dev_err_probe() usage
> > > - Use %u instead of %d for unsigned values
> > > - Don't split lines unnecessarily
> > > - Fix error handling in firmware upload initialization
> > > - Use CCI helpers in firmware update code
> > > - Fix runtime PM usage count
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   16 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/thp7312.c | 2339 +++++++++++++++++++++++++++++++++++
> > >  4 files changed, 2357 insertions(+)
> > >  create mode 100644 drivers/media/i2c/thp7312.c

[snip]

> > > diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> > > new file mode 100644
> > > index 000000000000..7d3de929079d
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/thp7312.c
> > > @@ -0,0 +1,2339 @@

[snip]

> > > +static int thp7312_sensor_init(struct thp7312_sensor *sensor, unsigned int index)
> > > +{
> > > +	struct thp7312_device *thp7312 = sensor->thp7312;
> > > +	struct device *dev = thp7312->dev;
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	sensor->index = index;
> > > +
> > > +	/*
> > > +	 * Register a device for the sensor, to support usage of the regulator
> > > +	 * API.
> > > +	 */
> > > +	sensor->dev = kzalloc(sizeof(*sensor->dev), GFP_KERNEL);
> > > +	if (!sensor->dev)
> > > +		return -ENOMEM;
> > > +
> > > +	sensor->dev->parent = dev;
> > > +	sensor->dev->of_node = of_node_get(sensor->of_node);
> > 
> > This device could well find its way to a non-OF system. Could you use the
> > fwnode property API instead?
> 
> I'm pretty sure there will be problems if someone was using this driver
> on an ACPI-based system, so trying to pretend it's supported without
> being able to test it may not be the best use of development time. I'll
> try, but if I hit any issue, I'll keep using the OF-specific functions
> in the next version.
> 
> > > +	sensor->dev->release = &thp7312_sensor_dev_release;
> > > +	dev_set_name(sensor->dev, "%s-%s.%u", dev_name(dev),
> > > +		     thp7312->sensor_info->name, index);
> > > +
> > > +	ret = device_register(sensor->dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to register device for sensor %u\n", index);
> > > +		put_device(sensor->dev);
> > > +		sensor->dev = NULL;
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* Retrieve the power supplies for the sensor, if any. */
> > > +	if (thp7312->sensor_info->supplies) {
> > > +		const struct thp7312_sensor_supply *supplies =
> > > +			thp7312->sensor_info->supplies;
> > > +		unsigned int num_supplies;
> > > +
> > > +		for (num_supplies = 0; supplies[num_supplies].name; ++num_supplies)
> > > +			;
> > > +
> > > +		sensor->supplies = devm_kcalloc(dev, num_supplies,
> > > +						sizeof(*sensor->supplies),
> > > +						GFP_KERNEL);
> > > +		if (!sensor->supplies) {
> > > +			ret = -ENOMEM;
> > > +			goto error;
> > > +		}
> > > +
> > > +		for (i = 0; i < num_supplies; ++i)
> > > +			sensor->supplies[i].supply = supplies[i].name;
> > > +
> > > +		ret = regulator_bulk_get(sensor->dev, num_supplies,
> > > +					 sensor->supplies);
> > > +		if (ret < 0) {
> > > +			dev_err(dev, "Failed to get supplies for sensor %u\n", index);
> > > +			goto error;
> > > +		}
> > > +
> > > +		sensor->num_supplies = i;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	device_unregister(sensor->dev);
> > > +	return ret;
> > > +}
> > > +
> > > +static int thp7312_init_sensors(struct thp7312_device *thp7312)
> > > +{
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(thp7312->sensors); i++) {
> > > +		struct thp7312_sensor *sensor = &thp7312->sensors[i];
> > > +
> > > +		if (!sensor->thp7312)
> > > +			continue;
> > > +
> > > +		ret = thp7312_sensor_init(sensor, i);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void thp7312_sensor_cleanup(struct thp7312_sensor *sensor)
> > > +{
> > > +	if (sensor->num_supplies)
> > > +		regulator_bulk_free(sensor->num_supplies, sensor->supplies);
> > > +
> > > +	if (sensor->dev)
> > > +		device_unregister(sensor->dev);
> > > +	of_node_put(sensor->of_node);
> > > +}
> > > +
> > > +static void thp7312_remove_sensors(struct thp7312_device *thp7312)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(thp7312->sensors); i++) {
> > > +		struct thp7312_sensor *sensor = &thp7312->sensors[i];
> > > +
> > > +		if (!sensor->thp7312)
> > > +			continue;
> > > +
> > > +		thp7312_sensor_cleanup(sensor);
> > > +	}
> > > +}
> > > +
> > > +static int thp7312_sensor_parse_dt(struct thp7312_device *thp7312,
> > > +				   struct device_node *node)
> > > +{
> > > +	struct device *dev = thp7312->dev;
> > > +	struct thp7312_sensor *sensor;
> > > +	u32 data_lanes_rx[4];
> > > +	const char *model;
> > > +	unsigned int i;
> > > +	u32 reg;
> > > +	int ret;
> > > +
> > > +	if (!of_device_is_available(node))
> > > +		return -ENODEV;
> > > +
> > > +	/* Retrieve the sensor index from the reg property. */
> > > +	ret = of_property_read_u32(node, "reg", &reg);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "'reg' property missing in sensor node\n");
> > 
> > Shouldn't you assume it's zero instead?
> 
> The property is mandatory.
> 
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (reg >= ARRAY_SIZE(thp7312->sensors)) {
> > > +		dev_err(dev, "Out-of-bounds 'reg' value %u\n", reg);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	sensor = &thp7312->sensors[reg];
> > > +	if (sensor->thp7312) {
> > > +		dev_err(dev, "Duplicate entry for sensor %u\n", reg);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = of_property_read_string(node, "thine,model", &model);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "'thine,model' property missing in sensor node\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(thp7312_sensor_info); i++) {
> > > +		const struct thp7312_sensor_info *info =
> > > +			&thp7312_sensor_info[i];
> > > +
> > > +		if (!strcmp(info->model, model)) {
> > > +			thp7312->sensor_info = info;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (!thp7312->sensor_info) {
> > > +		dev_err(dev, "Unsupported sensor model %s\n", model);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = of_property_read_u32_array(node, "data-lanes",
> > > +					 data_lanes_rx, ARRAY_SIZE(data_lanes_rx));
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to read property data-lanes: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(sensor->data_lanes); i++)
> > > +		sensor->data_lanes[i] = (u8)data_lanes_rx[i];
> > 
> > I don't think you need the cast here.
> > 
> > > +
> > > +	sensor->thp7312 = thp7312;
> > > +	sensor->of_node = of_node_get(node);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int thp7312_parse_dt(struct thp7312_device *thp7312)
> > > +{
> > > +	struct device *dev = thp7312->dev;
> > > +	struct fwnode_handle *endpoint;
> > > +	struct device_node *sensors;
> > > +	unsigned int num_sensors = 0;
> > > +	struct device_node *node;
> > > +	int ret;
> > > +
> > > +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > > +	if (!endpoint)
> > > +		return dev_err_probe(dev, -EINVAL, "Endpoint node not found\n");
> > > +
> > > +	ret = v4l2_fwnode_endpoint_parse(endpoint, &thp7312->ep);
> > 
> > You should assign the bus_type before parsing. It is deprecated to guess
> > it --- there's no universal guarantee it'll be successful.
> 
> As only CSI-2 is supported for now, I'll do so.
> 
> > > +	fwnode_handle_put(endpoint);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "Could not parse endpoint\n");
> > > +
> > > +	if (thp7312->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> > > +		return dev_err_probe(dev, -EINVAL, "Unsupported bus type %d\n",
> > > +				     thp7312->ep.bus_type);
> > > +
> > > +	/*
> > > +	 * The thine,boot-mode property is optional and default to
> > > +	 * THP7312_BOOT_MODE_SPI_MASTER (1).
> > > +	 */
> > > +	thp7312->boot_mode = THP7312_BOOT_MODE_SPI_MASTER;
> > > +	ret = of_property_read_u32(dev->of_node, "thine,boot-mode",
> > > +				   &thp7312->boot_mode);
> > > +	if (ret && ret != -EINVAL)
> > > +		return dev_err_probe(dev, ret, "Property '%s' is invalid\n",
> > > +				     "thine,boot-mode");
> > > +
> > > +	if (thp7312->boot_mode != THP7312_BOOT_MODE_2WIRE_SLAVE &&
> > > +	    thp7312->boot_mode != THP7312_BOOT_MODE_SPI_MASTER)
> > > +		return dev_err_probe(dev, -EINVAL, "Invalid '%s' value %u\n",
> > > +				     "thine,boot-mode", thp7312->boot_mode);
> > > +
> > > +	/* Sensors */
> > > +	sensors = of_get_child_by_name(dev->of_node, "sensors");
> > > +	if (!sensors) {
> > > +		dev_err(dev, "'sensors' child node not found\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	for_each_child_of_node(sensors, node) {
> > > +		if (of_node_name_eq(node, "sensor")) {

I couldn't find a fwnode equivalent to this, so I'll keep using the OF
API in the next version. If someone ever wants to use this device on a
non-OF system, they will have to implement support for it on top.

> > > +			if (!thp7312_sensor_parse_dt(thp7312, node))
> > > +				num_sensors++;
> > > +		}
> > > +	}
> > > +
> > > +	of_node_put(sensors);
> > > +
> > > +	if (!num_sensors) {
> > > +		dev_err(dev, "No sensor found\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}

[snip]

-- 
Regards,

Laurent Pinchart
